import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/order_payment/order_payment_router.dart';
import '../models/activity_model.dart';

// WIDGET for "Đang làm" (In Progress) activities
class InProgressActivityCard extends StatelessWidget {
  final InProgressActivityModel activity;

  const InProgressActivityCard({super.key, required this.activity});

  // Helper function to build a detail row with an icon
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: Colors.black54),
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 70, // Fixed width for the label
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget to display the Status Tag
  Widget _buildStatusTag(String text, {Color? bgColor, Color? textColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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

            // STAFF INFORMATION
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 70,
                  child: Text(
                    'Nhân viên:',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ),

                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(activity.staffAvatarUrl),
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.staffName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${activity.staffRating} (${activity.staffJobs} việc)',
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, color: Colors.black12),
            const SizedBox(height: 12),

            // ACTIVITY DETAILS
            _buildDetailRow(
                Icons.calendar_today_outlined, 'Ngày', activity.date),
            _buildDetailRow(
                Icons.schedule, 'Thời gian', activity.time),
            _buildDetailRow(
                Icons.location_on_outlined, 'Địa điểm', activity.location),

            const SizedBox(height: 8),

            // STATUS & PROGRESS
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    size: 16,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 8),
                  const SizedBox(
                    width: 70,
                    child: Text(
                      'Trạng thái',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  // ✅ FIX OVERFLOW: Use Wrap instead of Row
                  Expanded(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context.push(OrderPaymentRouter.activity);
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: _buildStatusTag(
                            activity.currentStatus,
                            bgColor: activity.statusColor,
                            textColor: activity.statusTextColor,
                          ),
                        ),

                        const Text(
                          '→',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // _buildStatusTag('Đang di chuyển'),
                        //
                        // const Text(
                        //   '→',
                        //   style: TextStyle(
                        //     color: Colors.black54,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),

                        _buildStatusTag('Đến nơi'),

                        const Text(
                          '→',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        _buildStatusTag('Đang làm'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // CHAT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Handle Chat event
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD97200), // Dark Orange
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Chat với nhân viên',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
