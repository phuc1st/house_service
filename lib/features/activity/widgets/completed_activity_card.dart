import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/order_payment/order_payment_router.dart';
import '../models/activity_model.dart';

// WIDGET for "Hoàn thành" (Completed) activities
class CompletedActivityCard extends StatelessWidget {
  final CompletedActivityModel activity;
  final VoidCallback onRatePressed;

  const CompletedActivityCard({
    super.key,
    required this.activity,
    required this.onRatePressed,
  });

  // Widget to display the Status Tag (with emoji)
  Widget _buildStatusTag(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 4),
          const Text('🥳', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine action button
    Widget actionButton;
    if (activity.hasRated) {
      actionButton = OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black12),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Đã đánh giá',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      actionButton = SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onRatePressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD97200), // Dark Orange
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Đánh giá nhân viên',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        context.push(OrderPaymentRouter.orderHistory);
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.black12, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Code
              Text(
                'Mã đơn: ${activity.orderCode}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              // Status row
              Row(
                children: [
                  const Icon(Icons.check_circle_outline,
                      size: 16, color: Colors.black54),
                  const SizedBox(width: 8),
                  const Text(
                    'Trạng thái',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  const SizedBox(width: 16),
                  _buildStatusTag(
                    activity.status,
                    activity.statusColor,
                    activity.statusTextColor,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // RATING/RATED BUTTON
              actionButton,
            ],
          ),
        ),
      ),
    );
  }
}