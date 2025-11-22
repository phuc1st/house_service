import 'package:flutter/material.dart';

class ProgressCirclePainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  ProgressCirclePainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - strokeWidth / 2;

    // Draw progress arc (approximately 1/3 of circle)
    const startAngle = -3.14159 / 2; // Start from top
    const sweepAngle = 2 * 3.14159 / 3; // 1/3 of circle

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + (progress * 2 * 3.14159),
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

