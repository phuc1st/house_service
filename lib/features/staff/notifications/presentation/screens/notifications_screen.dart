import 'package:flutter/material.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/staff_bottom_navigation_bar.dart';
import '../../data/notifications_mock_data.dart';
import '../widgets/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppHeader(
          title: 'Thông báo',
          backgroundColor: Colors.transparent,
        ),
        body: ListView.separated(
          itemCount: mockNotifications.length,
          separatorBuilder: (context, index) => const SizedBox.shrink(),
          itemBuilder: (context, index) {
            final notification = mockNotifications[index];
            return NotificationItem(
              notification: notification,
              onTap: () {
                // Handle notification tap
              },
            );
          },
        ),
        bottomNavigationBar: const StaffBottomNavigationBar(
          currentIndex: 3,
        ),
      ),
    );
  }
}


