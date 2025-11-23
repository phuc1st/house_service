import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/cancel_change_wallet/wallet/wallet_router.dart';
import '../../data/models/transaction.dart';
import 'transaction_item.dart';

class TransactionHistorySection extends StatelessWidget {
  const TransactionHistorySection({
    super.key,
    required this.transactions,
    this.onSearch,
  });

  final List<Transaction> transactions;
  final VoidCallback? onSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Lịch sử giao dịch',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search, size: 24),
                onPressed: onSearch ?? () {
                  GoRouter.of(context).push(WalletRouter.walletStatistics);
                },
                color: Colors.black87,
              ),
            ],
          ),
        ),
        // Transaction list
        ...transactions.map((transaction) => TransactionItem(
              transaction: transaction,
            )),
      ],
    );
  }
}

