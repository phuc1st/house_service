import 'package:flutter/material.dart';

class AppGradientBackground extends StatelessWidget {
  const AppGradientBackground({
    super.key,
    this.child,
    this.padding,
    this.alignment,
    this.borderRadius,
  });

  static const LinearGradient _defaultGradient = LinearGradient(
    colors: [
      Color(0xFFFFF8DF),
      Color(0xFFFFDDB1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        gradient: _defaultGradient,
        borderRadius: borderRadius,
      ),
      child: child,
    );

    if (borderRadius == null) {
      return content;
    }

    return ClipRRect(
      borderRadius: borderRadius!,
      child: content,
    );
  }
}

