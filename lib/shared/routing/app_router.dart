import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:project/features/auth/login_screen.dart';
import 'package:project/features/auth/register_step1_screen.dart';
import 'package:project/features/auth/register_step2_screen.dart';
import 'package:project/features/auth/verify_otp_screen.dart';
import 'package:project/features/auth/welcome_screen.dart';
import 'package:project/features/family_tips/family_tips_screen.dart';
import 'package:project/features/home/home_screen.dart';
import 'package:project/features/house_profile/house_profile_screen.dart';
import 'package:project/features/services/cleaning_service_screen.dart';
import 'package:project/features/loyalty/loyalty_screen.dart';
import 'package:project/features/order_payment/order_payment_router.dart';
import 'package:project/features/orders/order_confirmation_screen.dart';
import 'package:project/features/orders/order_details_screen.dart';
import 'package:project/features/orders/order_screen.dart';
import 'package:project/features/payments/payment_method_screen.dart';
import 'package:project/features/payments/payment_success_screen.dart';
import 'package:project/features/report_incident/report_incident_screen.dart';
import 'package:project/features/service_packages/service_packages_screen.dart';

class AppRouter {
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String registerStep1 = '/register-step1';
  static const String registerStep2 = '/register-step2';
  static const String verifyOtp = '/verify-otp';
  static const String home = '/home';
  static const String cleaningService = '/cleaning-service';
  static const String order = '/order';
  static const String orderConfirmation = '/order-confirmation';
  static const String paymentMethod = '/payment-method';
  static const String paymentSuccess = '/payment-success';
  static const String orderDetails = '/order-details';
  static const String reportIncident = '/report-incident';
  static const String familyTips = '/family-tips';
  static const String loyalty = '/loyalty';
  static const String houseProfile = '/house-profile';
  static const String servicePackages = '/service-packages';

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: orderDetails,
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
        path: home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: cleaningService,
        name: 'cleaning-service',
        builder: (context, state) => const CleaningServiceScreen(),
      ),
      GoRoute(
        path: order,
        name: 'order',
        builder: (context, state) => const OrderScreen(),
      ),
      GoRoute(
        path: orderConfirmation,
        name: 'order-confirmation',
        builder: (context, state) => const OrderConfirmationScreen(),
      ),
      GoRoute(
        path: paymentMethod,
        name: 'payment-method',
        builder: (context, state) => const PaymentMethodScreen(),
      ),
      GoRoute(
        path: paymentSuccess,
        name: 'payment-success',
        builder: (context, state) => const PaymentSuccessScreen(),
      ),
      GoRoute(
        path: orderDetails,
        name: 'order-details',
        builder: (context, state) => const OrderDetailsScreen(),
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
        path: servicePackages,
        name: 'service-packages',
        builder: (context, state) => const ServicePackagesScreen(),
      ),
      // Order Payment routes
      ...OrderPaymentRouter.routes,
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
}

