import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:project/features/auth/login_screen.dart';
import 'package:project/features/auth/register_step1_screen.dart';
import 'package:project/features/auth/register_step2_screen.dart';
import 'package:project/features/auth/verify_otp_screen.dart';
import 'package:project/features/auth/welcome_screen.dart';
import 'package:project/features/cancel_change_wallet/wallet/wallet_router.dart';
import 'package:project/features/order_payment/order_payment_router.dart';
import 'package:project/features/order_payment/service_waiting/presentation/screens/service_waiting_screen.dart';
import '../../features/activity/screens/waiting_activity_screen.dart';
import '../../features/message_profile/family_tips/family_tips_screen.dart';
import '../../features/message_profile/house_profile/house_profile_screen.dart';
import '../../features/message_profile/loyalty/loyalty_screen.dart';
import '../../features/message_profile/report_incident/report_incident_screen.dart';
import '../../features/message_profile/service_packages/service_packages_screen.dart';
import '../../features/message_profile/profile/profile_screen.dart';
import '../../features/message_profile/messages/messages_list_screen.dart';
import '../../features/order_payment/home/home_screen.dart';
import '../../features/order_payment/services_clean/cleaning_service_screen.dart';

class AppRouter {
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String registerStep1 = '/register-step1';
  static const String registerStep2 = '/register-step2';
  static const String verifyOtp = '/verify-otp';

  static const String reportIncident = '/report-incident';
  static const String familyTips = '/family-tips';
  static const String loyalty = '/loyalty';
  static const String houseProfile = '/house-profile';
  static const String messageProfile = '/message-profile';
  static const String messages = '/messages';
  static const String servicePackages = '/service-packages';
  static const String waitActivity = '/wait-activity';

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: welcome,
    routes: [
      GoRoute(
        path: welcome,
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: registerStep1,
        name: 'register-step1',
        builder: (context, state) => const RegisterStep1Screen(),
      ),
      GoRoute(
        path: registerStep2,
        name: 'register-step2',
        builder: (context, state) => const RegisterStep2Screen(),
      ),
      GoRoute(
        path: verifyOtp,
        name: 'verify-otp',
        builder: (context, state) => const VerifyOtpScreen(),
      ),
      GoRoute(
        path: reportIncident,
        name: 'report-incident',
        builder: (context, state) => const ReportIncidentScreen(),
      ),
      GoRoute(
        path: familyTips,
        name: 'family-tips',
        builder: (context, state) => const FamilyTipsScreen(),
      ),
      GoRoute(
        path: loyalty,
        name: 'loyalty',
        builder: (context, state) => const LoyaltyScreen(),
      ),
      GoRoute(
        path: houseProfile,
        name: 'house-profile',
        builder: (context, state) => const HouseProfileScreen(),
      ),
      GoRoute(
        path: messageProfile,
        name: 'message-profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: messages,
        name: 'messages',
        builder: (context, state) => const MessagesListScreen(),
      ),
      GoRoute(
        path: servicePackages,
        name: 'service-packages',
        builder: (context, state) => const ServicePackagesScreen(),
      ),
      GoRoute(
        path: waitActivity,
        name: 'wait-activity',
        builder: (context, state) => const WaitingActivityScreen(),
      ),
      // Order Payment routes
      ...OrderPaymentRouter.routes,
      // Wallet routes
      ...WalletRouter.routes,
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
}

