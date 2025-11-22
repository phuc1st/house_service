import 'package:flutter/material.dart';

class ServiceWaitingHeader extends StatelessWidget implements PreferredSizeWidget {
  const ServiceWaitingHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: kToolbarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              // Menu Icon
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xFFFFAA3C),
                ),
                onPressed: () {
                  // Handle menu tap
                },
              ),
              // Title
              const Expanded(
                child: Text(
                  'Houses Services',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFAA3C),
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
              // Avatar
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: const Icon(
                  Icons.person,
                  size: 20,
                  color: Color(0xFFFFAA3C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

