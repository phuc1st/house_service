import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:project/features/staff/staff_account_screen.dart';
import 'package:project/features/staff/staff_dashboard_screen.dart';
import 'package:project/features/staff/staff_income_screen.dart';
import 'package:project/features/staff/staff_job_detail_screen.dart';
import 'package:project/features/staff/staff_job_screen.dart';
import 'package:project/features/staff/staff_payout_screen.dart';
import 'package:project/features/staff/notifications/presentation/screens/notifications_screen.dart';
import 'package:project/features/staff/rewards/presentation/screens/rewards_screen.dart';
import 'package:project/features/staff/service_schedule/presentation/screens/service_schedule_screen.dart';
import 'package:project/features/staff/service_types/presentation/screens/service_types_screen.dart';
import 'package:project/features/staff/staff_profile/presentation/screens/staff_profile_screen.dart';

class StaffRouter {
  static const String dashboard = '/staff/dashboard';
  static const String job = '/staff/job';
  static const String jobDetail = '/staff/job-detail';
  static const String income = '/staff/income';
  static const String payout = '/staff/payout';
  static const String account = '/staff/account';
  static const String notifications = '/staff/notifications';
  static const String rewards = '/staff/rewards';
  static const String serviceTypes = '/staff/service-types';
  static const String serviceSchedule = '/staff/service-schedule';
  static const String staffProfile = '/staff/profile';

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
      GoRoute(
        path: notifications,
        name: 'staff-notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: rewards,
        name: 'staff-rewards',
        builder: (context, state) => const RewardsScreen(),
      ),
      GoRoute(
        path: serviceTypes,
        name: 'staff-service-types',
        builder: (context, state) => const ServiceTypesScreen(),
      ),
      GoRoute(
        path: serviceSchedule,
        name: 'staff-service-schedule',
        builder: (context, state) => const ServiceScheduleScreen(),
      ),
      GoRoute(
        path: staffProfile,
        name: 'staff-profile',
        builder: (context, state) => const StaffProfileScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
}

