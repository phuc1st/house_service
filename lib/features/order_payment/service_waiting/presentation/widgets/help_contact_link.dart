import 'package:flutter/material.dart';

class HelpContactLink extends StatelessWidget {
  const HelpContactLink({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle help contact
      },
      child: const Text(
        'Trợ giúp ? Liên hệ',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFFAA3C),
          fontFamily: 'Quicksand',
        ),
      ),
    );
  }
}

