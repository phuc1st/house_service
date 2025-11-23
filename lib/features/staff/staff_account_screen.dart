import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/staff/staff_router.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/staff_bottom_navigation_bar.dart';

class StaffAccountScreen extends StatelessWidget {
  const StaffAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppHeader(
          title: 'Tài khoản',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              // Profile Section
              _buildProfileSection(),
              const SizedBox(height: 24),
              // Account Options
              _buildAccountOptions(context),
              const SizedBox(height: 16),
              // Logout Button
              _buildLogoutButton(),
              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: const StaffBottomNavigationBar(
          currentIndex: 3,
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, size: 50, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        const Text(
          'Olivia Harper',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'olivia.harper@example.com',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 4),
            const Text(
              '4.8/5(142 đánh giá)',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAccountOptions(BuildContext context) {
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
        children: [
          _buildOptionItem(
            Icons.settings,
            'Chi tiết',
            onTap: () {
              context.push(StaffRouter.staffProfile);
            },
          ),
          const Divider(),
          _buildOptionItem(
            Icons.notifications_outlined,
            'Thông báo',
            onTap: () {
              context.push(StaffRouter.notifications);
            },
          ),
          const Divider(),
          _buildOptionItem(Icons.payment, 'Phương thức thanh toán'),
          const Divider(),
          _buildOptionItem(Icons.help_outline, 'Trợ giúp'),
          const Divider(),
          _buildOptionItem(
            Icons.apps_outlined,
            'Loại dịch vụ',
            onTap: () {
              context.push(StaffRouter.serviceTypes);
            },
          ),
          const Divider(),
          _buildOptionItem(
            Icons.payments_outlined,
            'Tiền thưởng',
            onTap: () {
              context.push(StaffRouter.rewards);
            },
          ),
          const Divider(),
          _buildOptionItem(
            Icons.calendar_today_outlined,
            'Lịch công việc',
            onTap: () {
              context.push(StaffRouter.serviceSchedule);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildOptionItem(IconData icon, String label, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? () {
        // Handle option tap
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return OutlinedButton(
      onPressed: () {
        // Handle logout
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFFB23D0A),
        side: const BorderSide(color: Color(0xFFB23D0A)),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text(
        'Đăng xuất',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

