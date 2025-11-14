import 'package:flutter/material.dart';

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
          _buildItem(Icons.explore, 'Home'),
          _buildItem(Icons.list_alt, 'Activity'),
          _buildItem(Icons.chat_bubble_outline, 'Messages'),
          _buildItem(Icons.payment, 'Payment'),
        ],
        onTap: onTap,
      ),
    );
  }
}

