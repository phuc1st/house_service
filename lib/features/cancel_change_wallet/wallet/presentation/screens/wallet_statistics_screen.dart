import 'package:flutter/material.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import '../../data/wallet_mock_data.dart';
import '../widgets/wallet_profile_header.dart';
import '../widgets/financial_summary_cards.dart';
import '../widgets/monthly_bar_chart.dart';
import '../widgets/transaction_history_section.dart';

class WalletStatisticsScreen extends StatelessWidget {
  const WalletStatisticsScreen({super.key});

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
            Navigator.of(context).pop();
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
              // Financial Summary Cards
              FinancialSummaryCards(
                income: mockIncome,
                expenses: mockExpenses,
              ),
              const SizedBox(height: 16),
              // Monthly Bar Chart
              MonthlyBarChart(monthlyData: mockMonthlyData),
              const SizedBox(height: 16),
              // Transaction History
              TransactionHistorySection(
                transactions: mockTransactions,
                onSearch: () {
                  // Handle search
                },
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

