import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'presentation/screens/top_up_screen.dart';
import 'presentation/screens/top_up_amount_screen.dart';
import 'presentation/screens/top_up_transfer_screen.dart';
import 'presentation/screens/wallet_screen.dart';
import 'presentation/screens/wallet_statistics_screen.dart';

class WalletRouter {
  static const String wallet = '/wallet';
  static const String topUp = '/wallet/top-up';
  static const String topUpAmount = '/wallet/top-up/amount';
  static const String topUpTransfer = '/wallet/top-up/transfer';
  static const String walletStatistics = '/wallet/statistics';

  static List<RouteBase> get routes => [
        GoRoute(
          path: wallet,
          name: 'wallet',
          builder: (context, state) => const WalletScreen(),
        ),
        GoRoute(
          path: topUp,
          name: 'top-up',
          builder: (context, state) => const TopUpScreen(),
        ),
        GoRoute(
          path: topUpAmount,
          name: 'top-up-amount',
          builder: (context, state) => const TopUpAmountScreen(),
        ),
        GoRoute(
          path: topUpTransfer,
          name: 'top-up-transfer',
          builder: (context, state) => const TopUpTransferScreen(),
        ),
        GoRoute(
          path: walletStatistics,
          name: 'wallet-statistics',
          builder: (context, state) => const WalletStatisticsScreen(),
        ),
      ];
}

