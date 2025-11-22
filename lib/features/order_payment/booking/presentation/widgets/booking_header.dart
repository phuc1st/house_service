import 'package:flutter/material.dart';

class BookingHeader extends StatelessWidget implements PreferredSizeWidget {
  const BookingHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: kToolbarHeight + 20,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.black.withOpacity(0.5),
                width: 0.5,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            children: [
              // Back button
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              // Title
              const Expanded(
                child: Text(
                  'Đặt hàng chi tiết',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
              // More options
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  size: 20,
                  color: Colors.black87,
                ),
                onPressed: () {
                  // Handle more options
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

