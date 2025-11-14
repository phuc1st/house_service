import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:project/features/family_tips/family_tips_screen.dart';
import 'package:project/features/house_profile/house_profile_screen.dart';
import 'package:project/features/loyalty/loyalty_screen.dart';
import 'package:project/features/orders/order_confirmation_screen.dart';
import 'package:project/features/orders/order_details_screen.dart';
import 'package:project/features/payments/payment_method_screen.dart';
import 'package:project/features/payments/payment_success_screen.dart';
import 'package:project/features/report_incident/report_incident_screen.dart';
import 'package:project/features/service_packages/service_packages_screen.dart';

class AppRouter {
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
    initialLocation: servicePackages    ,
    routes: [
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
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
}

