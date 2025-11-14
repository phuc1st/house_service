import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFB23D03);
  static const Color secondary = Color(0xFFFFAA3C);
  static const Color background = Color(0xFFFFE4D1);

  static ThemeData get light {
    const baseTextColor = Colors.black87;
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: Colors.white,
        secondary: secondary,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: background,
        onBackground: baseTextColor,
        surface: Colors.white,
        onSurface: baseTextColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: baseTextColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: baseTextColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          side: const BorderSide(color: primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

