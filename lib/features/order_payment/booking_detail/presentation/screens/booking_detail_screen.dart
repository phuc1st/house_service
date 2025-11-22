import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/shared/routing/app_router.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';
import '../../data/booking_detail_mock_data.dart';
import '../../data/models/booking_detail.dart';
import '../widgets/service_header_section.dart';
import '../widgets/time_selection_section.dart';
import '../widgets/address_section.dart';
import '../widgets/notes_section.dart';
import '../widgets/price_summary_section.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({
    super.key,
    required this.roomId,
  });

  final String roomId;

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  late BookingDetail _bookingDetail;

  @override
  void initState() {
    super.initState();
    // In real app, fetch booking detail by roomId
    // For now, use mock data
    _bookingDetail = getMockBookingDetail(
      roomId: widget.roomId,
      roomName: 'Phòng khách',
      roomIcon: Icons.chair,
      roomImageUrl:
          'https://www.figma.com/api/mcp/asset/d6bc1cde-d02e-4ef9-8bcf-f5df8e584e66',
      quantity: 1,
    );
  }

  void _onDateChanged(DateTime date) {
    setState(() {
      _bookingDetail = BookingDetail(
        roomId: _bookingDetail.roomId,
        roomName: _bookingDetail.roomName,
        roomIcon: _bookingDetail.roomIcon,
        roomImageUrl: _bookingDetail.roomImageUrl,
        serviceName: _bookingDetail.serviceName,
        orderId: _bookingDetail.orderId,
        serviceProviderAvatar: _bookingDetail.serviceProviderAvatar,
        selectedDate: date,
        startTime: _bookingDetail.startTime,
        duration: _bookingDetail.duration,
        address: _bookingDetail.address,
        addressDetail: _bookingDetail.addressDetail,
        notes: _bookingDetail.notes,
        servicePricePerHour: _bookingDetail.servicePricePerHour,
        serviceFeePercent: _bookingDetail.serviceFeePercent,
        quantity: _bookingDetail.quantity,
      );
    });
  }

  void _onTimeChanged(String time) {
    setState(() {
      _bookingDetail = BookingDetail(
        roomId: _bookingDetail.roomId,
        roomName: _bookingDetail.roomName,
        roomIcon: _bookingDetail.roomIcon,
        roomImageUrl: _bookingDetail.roomImageUrl,
        serviceName: _bookingDetail.serviceName,
        orderId: _bookingDetail.orderId,
        serviceProviderAvatar: _bookingDetail.serviceProviderAvatar,
        selectedDate: _bookingDetail.selectedDate,
        startTime: time,
        duration: _bookingDetail.duration,
        address: _bookingDetail.address,
        addressDetail: _bookingDetail.addressDetail,
        notes: _bookingDetail.notes,
        servicePricePerHour: _bookingDetail.servicePricePerHour,
        serviceFeePercent: _bookingDetail.serviceFeePercent,
        quantity: _bookingDetail.quantity,
      );
    });
  }

  void _onDurationChanged(int duration) {
    setState(() {
      _bookingDetail = BookingDetail(
        roomId: _bookingDetail.roomId,
        roomName: _bookingDetail.roomName,
        roomIcon: _bookingDetail.roomIcon,
        roomImageUrl: _bookingDetail.roomImageUrl,
        serviceName: _bookingDetail.serviceName,
        orderId: _bookingDetail.orderId,
        serviceProviderAvatar: _bookingDetail.serviceProviderAvatar,
        selectedDate: _bookingDetail.selectedDate,
        startTime: _bookingDetail.startTime,
        duration: duration,
        address: _bookingDetail.address,
        addressDetail: _bookingDetail.addressDetail,
        notes: _bookingDetail.notes,
        servicePricePerHour: _bookingDetail.servicePricePerHour,
        serviceFeePercent: _bookingDetail.serviceFeePercent,
        quantity: _bookingDetail.quantity,
      );
    });
  }

  void _onNotesChanged(String notes) {
    setState(() {
      _bookingDetail = BookingDetail(
        roomId: _bookingDetail.roomId,
        roomName: _bookingDetail.roomName,
        roomIcon: _bookingDetail.roomIcon,
        roomImageUrl: _bookingDetail.roomImageUrl,
        serviceName: _bookingDetail.serviceName,
        orderId: _bookingDetail.orderId,
        serviceProviderAvatar: _bookingDetail.serviceProviderAvatar,
        selectedDate: _bookingDetail.selectedDate,
        startTime: _bookingDetail.startTime,
        duration: _bookingDetail.duration,
        address: _bookingDetail.address,
        addressDetail: _bookingDetail.addressDetail,
        notes: notes,
        servicePricePerHour: _bookingDetail.servicePricePerHour,
        serviceFeePercent: _bookingDetail.serviceFeePercent,
        quantity: _bookingDetail.quantity,
      );
    });
  }

  void _onContinue() {
    // Handle continue order
    // Navigate to next screen
    context.push(AppRouter.orderConfirmation);
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppHeader(
          title: 'Đặt hàng',
          backgroundColor: Colors.transparent,
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            color: Colors.black87,
            onPressed: () {
              // Handle more options
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              // Service Header
              ServiceHeaderSection(bookingDetail: _bookingDetail),
              const SizedBox(height: 16),
              // Time Selection Section
              TimeSelectionSection(
                bookingDetail: _bookingDetail,
                onDateChanged: _onDateChanged,
                onTimeChanged: _onTimeChanged,
                onDurationChanged: _onDurationChanged,
              ),
              const SizedBox(height: 16),
              // Address Section
              AddressSection(
                bookingDetail: _bookingDetail,
                onChangeAddress: () {
                  // Handle change address
                },
              ),
              const SizedBox(height: 16),
              // Notes Section
              NotesSection(
                bookingDetail: _bookingDetail,
                onNotesChanged: _onNotesChanged,
              ),
              const SizedBox(height: 16),
              // Price Summary Section
              PriceSummarySection(bookingDetail: _bookingDetail),
              const SizedBox(height: 24),
              // Continue Button
              AppPrimaryButton(
                label: 'Tiếp tục đơn hàng',
                onPressed: _onContinue,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
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
