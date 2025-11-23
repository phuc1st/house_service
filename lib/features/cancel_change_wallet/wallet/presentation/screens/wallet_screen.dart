import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/cancel_change_wallet/wallet/wallet_router.dart';
import 'package:project/shared/routing/app_router.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import '../../data/wallet_mock_data.dart';
import '../widgets/wallet_profile_header.dart';
import '../widgets/balance_card.dart';
import '../widgets/bank_account_card.dart';
import '../widgets/transaction_history_section.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 18) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppHeader(
          title: '',
          backgroundColor: Colors.transparent,
          onBack: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              // If no route to pop, navigate to order details
              context.go(AppRouter.orderDetails);
            }
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              // Profile Header
              WalletProfileHeader(
                userName: mockUserName,
                avatarImage: mockUserAvatar,
                greeting: _getGreeting(),
              ),
              const SizedBox(height: 16),
              // Balance Card
              BalanceCard(
                balance: mockBalance,
                onAdd: () {
                  context.push(WalletRouter.topUp);
                },
                onSubtract: () {
                  // Handle subtract balance
                },
              ),
              const SizedBox(height: 8),
              // Bank Account Card
              BankAccountCard(bankAccount: mockBankAccount),
              const SizedBox(height: 16),
              // Transaction History
              TransactionHistorySection(
                transactions: mockTransactions,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(
          currentIndex: 0,
        ),
      ),
    );
  }
}

