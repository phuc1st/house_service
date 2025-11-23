import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/order_payment/order_payment_router.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import '../../data/booking_mock_data.dart';
import '../../data/models/room.dart';
import '../widgets/booking_header.dart';
import '../widgets/service_header.dart';
import '../widgets/room_card.dart';
import '../widgets/continue_button.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late List<Room> _rooms;

  @override
  void initState() {
    super.initState();
    _rooms = List.from(mockRooms);
  }

  void _increaseQuantity(int index) {
    setState(() {
      _rooms[index] = _rooms[index].copyWith(
        quantity: _rooms[index].quantity + 1,
      );
    });
  }

  void _decreaseQuantity(int index) {
    if (_rooms[index].quantity > 0) {
      setState(() {
        _rooms[index] = _rooms[index].copyWith(
          quantity: _rooms[index].quantity - 1,
        );
      });
    }
  }

  void _onContinue() {
    context.push(OrderPaymentRouter.bookingDetail);
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const BookingHeader(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              // Service Header
              ServiceHeader(service: mockService),
              const SizedBox(height: 24),
              // Rooms List
              ..._rooms.asMap().entries.map((entry) {
                final index = entry.key;
                final room = entry.value;
                return RoomCard(
                  room: room,
                  onIncrease: () => _increaseQuantity(index),
                  onDecrease: () => _decreaseQuantity(index),
                );
              }),
              // Continue Button
              ContinueButton(onPressed: _onContinue),
              const SizedBox(height: 24),
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

