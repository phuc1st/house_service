import 'package:flutter/material.dart';

class WaitTimeDisplay extends StatelessWidget {
  const WaitTimeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Thời gian chờ:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontFamily: 'Quicksand',
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          '5-10 MIN',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFAA3C),
            fontFamily: 'Roboto',
            height: 1.2,
          ),
        ),
      ],
    );
  }
}


