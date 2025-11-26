import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/order_payment/order_payment_router.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;

  static const Color _selectedColor = Color(0xFFB23D0A);
  static const EdgeInsets _itemPadding = EdgeInsets.all(8.0);

  static BottomNavigationBarItem _buildItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: _itemPadding,
        child: Icon(icon),
      ),
      label: label,
    );
  }

  void _handleTap(BuildContext context, int index) {
    if (onTap != null) {
      onTap!(index);
      return;
    }

    // Default navigation behavior
    switch (index) {
      case 0: // Trang chủ
        context.go(OrderPaymentRouter.home);
        break;
      case 1: // Hoạt động
        context.go(OrderPaymentRouter.activity);
        break;
      case 2: // Tin nhắn
        // TODO: Navigate to messages page
        break;
      case 3: // Tài khoản
        // TODO: Navigate to account page
        break;
    }
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
          _buildItem(Icons.explore, 'Trang chủ'),
          _buildItem(Icons.list_alt, 'Hoạt động'),
          _buildItem(Icons.chat_bubble_outline, 'Tin nhắn'),
          _buildItem(Icons.account_circle, 'Tài khoản'),
        ],
        onTap: (index) => _handleTap(context, index),
      ),
    );
  }
}

