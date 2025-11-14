import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:project/features/staff/staff_router.dart';

class StaffBottomNavigationBar extends StatelessWidget {
  const StaffBottomNavigationBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;

  static const Color _selectedColor = Color(0xFFB23D0A);

  static BottomNavigationBarItem _buildItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: _selectedColor,
        unselectedItemColor: Colors.grey,
        items: [
          _buildItem(Icons.home, 'Trang chủ'),
          _buildItem(Icons.work_outline, 'Công việc'),
          _buildItem(Icons.account_balance_wallet_outlined, 'Thu nhập'),
          _buildItem(Icons.person_outline, 'Tài khoản'),
        ],
        onTap: onTap ?? (index) => _handleNavigation(context, index),
      ),
    );
  }

  void _handleNavigation(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(StaffRouter.dashboard);
        break;
      case 1:
        context.go(StaffRouter.job);
        break;
      case 2:
        context.go(StaffRouter.income);
        break;
      case 3:
        context.go(StaffRouter.account);
        break;
    }
  }
}

