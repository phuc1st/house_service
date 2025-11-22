import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'booking/presentation/screens/booking_screen.dart';
import 'booking_detail/presentation/screens/booking_detail_screen.dart';
import 'profile/presentation/screens/profile_screen.dart';
import 'search/presentation/screens/search_screen.dart';
import 'service_detail/presentation/screens/service_detail_screen.dart';
import 'service_waiting/presentation/screens/service_waiting_screen.dart';

class OrderPaymentRouter {
  // Route paths
  static const String search = '/search';
  static const String booking = '/booking';
  static const String bookingDetail = '/booking-detail';
  static const String profile = '/profile';
  static const String serviceDetail = '/service-detail';
  static const String serviceWaiting = '/service-waiting';

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
      ];
}

