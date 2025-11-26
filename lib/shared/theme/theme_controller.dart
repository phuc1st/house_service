import 'package:flutter/material.dart';

class ThemeController {
  // simple global notifier for dark mode
  static final ValueNotifier<bool> isDark = ValueNotifier<bool>(false);

  static void setDark(bool v) => isDark.value = v;

  static void toggle() => isDark.value = !isDark.value;
}
