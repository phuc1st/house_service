import 'package:flutter/material.dart';
import 'package:project/features/cancel_change_wallet/cancel_order/presentation/widgets/cancel_order_modal.dart';
import 'package:project/features/cancel_change_wallet/reschedule/presentation/widgets/reschedule_calendar_modal.dart';

import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppHeader(
          title: 'Chi tiết đơn hàng',
          backgroundColor: Colors.transparent,
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            color: Colors.black87,
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              // Service Information Card
              _buildServiceCard(),
              const SizedBox(height: 16),
              // Appointment Details Card
              _buildAppointmentCard(),
              const SizedBox(height: 16),
              // Payment Summary Card
              _buildPaymentSummaryCard(),
              const SizedBox(height: 16),
              // Action Buttons
              _buildActionButtons(context),
              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(
          currentIndex: 0,
        ),
      ),
    );
  }

  Widget _buildServiceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Avatar placeholder
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.pets, size: 30, color: Colors.grey),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Dọn dẹp nhà cửa',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Mã đơn: #8843-2551',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Nested provider card
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.pets, size: 20, color: Colors.grey),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'TaPu',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '5.0/5 (400 việc)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chi tiết lịch hẹn',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildDetailRow(Icons.calendar_today, 'Ngày', 'Thứ Sáu, 12 Th2 2026'),
          const SizedBox(height: 12),
          _buildDetailRow(Icons.access_time, 'Thời gian', '10:00 - 12:00 (2 giờ)'),
          const SizedBox(height: 12),
          _buildDetailRow(Icons.location_on, 'Địa điểm', 'Nhà của tôi'),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.grey, size: 20),
              const SizedBox(width: 12),
              const Text(
                'Trạng thái',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF34A853),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Đã lên lịch',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 20),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tóm tắt thanh toán',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildPaymentRow('Chi phí dịch vụ (2 giờ)', '200.000 VNĐ'),
          const SizedBox(height: 12),
          _buildPaymentRow('Phí dịch vụ', '30.000 VNĐ'),
          const SizedBox(height: 12),
          _buildPaymentRow(
            'Giảm giá',
            '-20.000 VNĐ',
            valueColor: const Color(0xFF34A853),
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Tổng cộng',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                '210.000 VNĐ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Đã thanh toán quan Visa ***181612',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        AppPrimaryButton(
          label: 'Hủy đơn hàng',
          onPressed: () {
            _showCancelOrderModal(context);
          },
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () {
            _showRescheduleModal(context);
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            side: const BorderSide(color: Color(0xFFB23D0A)),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: const SizedBox(
            width: double.infinity,
            child: Text(
              'Thay đổi lịch hẹn',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: valueColor ?? Colors.black87,
          ),
        ),
      ],
    );
  }

  void _showCancelOrderModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CancelOrderModal(
          onConfirm: (String reason, String? otherReason) {
            // Handle cancel order with reason
            // TODO: Implement cancel order logic
            print('Cancel reason: $reason');
            if (otherReason != null) {
              print('Other reason: $otherReason');
            }
          },
        );
      },
    );
  }

  void _showRescheduleModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RescheduleCalendarModal(
          initialDate: DateTime(2026, 2, 12), // Default date from the design
          onDateSelected: (DateTime selectedDate) {
            // Handle date selection
            // TODO: Implement reschedule logic
            print('Selected date: $selectedDate');
          },
        );
      },
    );
  }
}

