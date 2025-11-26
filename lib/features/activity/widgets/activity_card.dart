import 'package:flutter/material.dart';

import '../models/activity_model.dart';

// WIDGET for basic activities (Waiting, Canceled)
class ActivityCard extends StatelessWidget {
  final ActivityModel activity;
  final bool showFullDetails; // Flag to control full detail display

  const ActivityCard({super.key, required this.activity, this.showFullDetails = true});

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

  // Widget to display the Status Tag (reused in other cards)
  Widget _buildStatusTag(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
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
            Padding(
              padding: EdgeInsets.only(bottom: showFullDetails ? 12.0 : 8.0),
              child: Text(
                'Mã đơn: ${activity.orderCode}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),

            if (showFullDetails) ...[
              const Divider(height: 1, color: Colors.black12),
              const SizedBox(height: 12),
              // Details
              _buildDetailRow(
                  Icons.calendar_today_outlined, 'Ngày', activity.date),
              _buildDetailRow(
                  Icons.schedule, 'Thời gian', activity.time),
              _buildDetailRow(
                  Icons.location_on_outlined, 'Địa điểm', activity.location),
            ],

            // Status Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline, size: 16, color: Colors.black54),
                    const SizedBox(width: 8),
                    const Text(
                      'Trạng thái',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                // Status Tag
                _buildStatusTag(
                  activity.status,
                  activity.statusColor,
                  activity.statusTextColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// WIDGET for "Đã Hủy" (Canceled) activities
class CanceledActivityCard extends StatelessWidget {
  final ActivityModel activity;

  const CanceledActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    // Reuse ActivityCard but only show Code and Status
    return ActivityCard(
      activity: activity,
      showFullDetails: false,
    );
  }
}