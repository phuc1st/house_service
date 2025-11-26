import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/order_payment/home/home_screen.dart';
import 'package:project/features/order_payment/orders/order_confirmation_screen.dart';
import 'package:project/features/order_payment/orders/order_details_screen.dart';
import 'package:project/features/order_payment/orders/order_screen.dart';
import 'package:project/features/order_payment/payments/payment_method_screen.dart';
import 'package:project/features/order_payment/payments/payment_success_screen.dart';
import 'package:project/features/order_payment/services_clean/cleaning_service_screen.dart';

import 'booking/presentation/screens/booking_screen.dart';
import 'booking_detail/presentation/screens/booking_detail_screen.dart';
import 'profile/presentation/screens/profile_screen.dart';
import 'search/presentation/screens/search_screen.dart';
import 'service_detail/presentation/screens/service_detail_screen.dart';
import 'service_waiting/presentation/screens/service_waiting_screen.dart';
import 'orders/order_history_screen.dart';
import 'activity/activity_screen.dart';

class OrderPaymentRouter {
  // Route paths
  static const String search = '/search';
  static const String booking = '/booking';
  static const String bookingDetail = '/booking-detail';
  static const String profile = '/profile';
  static const String serviceDetail = '/service-detail';
  static const String serviceWaiting = '/service-waiting';
  static const String order = '/order';
  static const String orderHistory = '/order-history';
  static const String orderConfirmation = '/order-confirmation';
  static const String paymentMethod = '/payment-method';
  static const String paymentSuccess = '/payment-success';
  static const String orderDetails = '/order-details';
  static const String cleaningService = '/cleaning-service';
  static const String home = '/home';
  static const String activity = '/activity';

  // Get all routes for order_payment feature
  static List<RouteBase> get routes => [
    GoRoute(
      path: search,
      name: 'search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: booking,
      name: 'booking',
      builder: (context, state) => const BookingScreen(),
    ),
    GoRoute(
      path: bookingDetail,
      name: 'booking-detail',
      builder: (context, state) {
        final roomId = state.uri.queryParameters['roomId'] ?? '';
        return BookingDetailScreen(roomId: roomId);
      },
    ),
    GoRoute(
      path: profile,
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: serviceDetail,
      name: 'service-detail',
      builder: (context, state) => const ServiceDetailScreen(),
    ),
    GoRoute(
      path: serviceWaiting,
      name: 'service-waiting',
      builder: (context, state) => const ServiceWaitingScreen(),
    ),
    GoRoute(
      path: order,
      name: 'order',
      builder: (context, state) => const OrderScreen(),
    ),
    GoRoute(
      path: orderHistory,
      name: 'order-history',
      builder: (context, state) => const OrderHistoryScreen(),
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
      path: cleaningService,
      name: 'cleaning-service',
      builder: (context, state) => const CleaningServiceScreen(),
    ),
    GoRoute(
      path: home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: activity,
      name: 'activity',
      builder: (context, state) => const ActivityScreen(),
    ),
  ];
}
