import 'package:flutter/material.dart';
import '../widgets/dotted_circle_painter.dart';
import '../widgets/progress_circle_painter.dart';

class SearchAnimation extends StatelessWidget {
  final Animation<double> rotationAnimation;

  const SearchAnimation({
    super.key,
    required this.rotationAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer circle (dotted)
          CustomPaint(
            size: const Size(194, 194),
            painter: DottedCirclePainter(
              color: const Color(0xFFFFE4D1),
              strokeWidth: 2,
            ),
          ),
          // Progress circle (solid arc)
          AnimatedBuilder(
            animation: rotationAnimation,
            builder: (context, child) {
              return CustomPaint(
                size: const Size(194, 194),
                painter: ProgressCirclePainter(
                  progress: rotationAnimation.value,
                  color: const Color(0xFFFFAA3C),
                  strokeWidth: 2,
                ),
              );
            },
          ),
          // Middle circle (white background)
          Container(
            width: 97,
            height: 97,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFFFE4D1),
                width: 2,
              ),
            ),
          ),
          // House Icon with search
          Stack(
            alignment: Alignment.center,
            children: [
              // House icon
              const Icon(
                Icons.home,
                size: 80,
                color: Color(0xFFFFAA3C),
              ),
              // Search icon overlay
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.search,
                    size: 16,
                    color: Color(0xFFFFAA3C),
                  ),
                ),
              ),
            ],
          ),
          // Rotating arrow
          Positioned(
            right: 20,
            top: 20,
            child: AnimatedBuilder(
              animation: rotationAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: rotationAnimation.value * 2 * 3.14159,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Color(0xFFFFAA3C),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

