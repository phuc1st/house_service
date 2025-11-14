import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:project/features/staff/staff_account_screen.dart';
import 'package:project/features/staff/staff_dashboard_screen.dart';
import 'package:project/features/staff/staff_income_screen.dart';
import 'package:project/features/staff/staff_job_detail_screen.dart';
import 'package:project/features/staff/staff_job_screen.dart';
import 'package:project/features/staff/staff_payout_screen.dart';

class StaffRouter {
  static const String dashboard = '/staff/dashboard';
  static const String job = '/staff/job';
  static const String jobDetail = '/staff/job-detail';
  static const String income = '/staff/income';
  static const String payout = '/staff/payout';
  static const String account = '/staff/account';

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: dashboard,
    routes: [
      GoRoute(
        path: dashboard,
        name: 'staff-dashboard',
        builder: (context, state) => const StaffDashboardScreen(),
      ),
      GoRoute(
        path: job,
        name: 'staff-job',
        builder: (context, state) => const StaffJobScreen(),
      ),
      GoRoute(
        path: jobDetail,
        name: 'staff-job-detail',
        builder: (context, state) => const StaffJobDetailScreen(),
      ),
      GoRoute(
        path: income,
        name: 'staff-income',
        builder: (context, state) => const StaffIncomeScreen(),
      ),
      GoRoute(
        path: payout,
        name: 'staff-payout',
        builder: (context, state) => const StaffPayoutScreen(),
      ),
      GoRoute(
        path: account,
        name: 'staff-account',
        builder: (context, state) => const StaffAccountScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
}

