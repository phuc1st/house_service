import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.expand = true,
    this.padding = const EdgeInsets.all(24),
  });

  final String label;
  final VoidCallback? onPressed;
  final bool expand;
  final EdgeInsetsGeometry padding;

  static const Color _backgroundColor = Color(0xFFB23D0A);

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor,
        foregroundColor: Colors.white,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );

    if (!expand) {
      return button;
    }

    return SizedBox(
      width: double.infinity,
      child: button,
    );
  }
}



