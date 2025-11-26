import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class QRCodeDisplay extends StatelessWidget {
  const QRCodeDisplay({
    super.key,
    required this.data,
    this.size = 200,
  });

  final String data;
  final double size;

  @override
  Widget build(BuildContext context) {
    // Placeholder QR code - in production, use qr_flutter package
    return CustomPaint(
      size: Size(size, size),
      painter: _QRCodePainter(data: data),
    );
  }
}

class _QRCodePainter extends CustomPainter {
  _QRCodePainter({required this.data});

  final String data;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Draw a simple placeholder QR code pattern
    // In production, use a QR code generation library
    final cellSize = size.width / 25;
    
    // Draw border
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );

    // Draw placeholder pattern (checkerboard-like)
    for (int i = 0; i < 25; i++) {
      for (int j = 0; j < 25; j++) {
        if ((i + j) % 3 == 0 || (i * j) % 7 == 0) {
          canvas.drawRect(
            Rect.fromLTWH(
              i * cellSize,
              j * cellSize,
              cellSize,
              cellSize,
            ),
            paint,
          );
        }
      }
    }

    // Draw corner squares (QR code feature)
    final cornerSize = cellSize * 7;
    _drawCornerSquare(canvas, Offset(0, 0), cornerSize);
    _drawCornerSquare(canvas, Offset(size.width - cornerSize, 0), cornerSize);
    _drawCornerSquare(
        canvas, Offset(0, size.height - cornerSize), cornerSize);
  }

  void _drawCornerSquare(Canvas canvas, Offset offset, double size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Outer square
    canvas.drawRect(
      Rect.fromLTWH(offset.dx, offset.dy, size, size),
      paint,
    );

    // Inner white square
    final innerSize = size * 0.6;
    final innerOffset = (size - innerSize) / 2;
    canvas.drawRect(
      Rect.fromLTWH(
        offset.dx + innerOffset,
        offset.dy + innerOffset,
        innerSize,
        innerSize,
      ),
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );

    // Inner black square
    final centerSize = innerSize * 0.4;
    final centerOffset = (size - centerSize) / 2;
    canvas.drawRect(
      Rect.fromLTWH(
        offset.dx + centerOffset,
        offset.dy + centerOffset,
        centerSize,
        centerSize,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}



