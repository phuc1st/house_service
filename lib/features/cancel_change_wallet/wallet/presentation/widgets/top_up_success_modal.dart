import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/shared/routing/app_router.dart';

class TopUpSuccessModal extends StatelessWidget {
  const TopUpSuccessModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF8DF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF388E3C), // Darker green border
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.check,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // Success Message
            const Text(
              'Bạn đã nạp tiền thành công!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            // Action Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.go(AppRouter.wallet);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB23D0A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Đi đến Ví của bạn',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

