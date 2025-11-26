import 'package:flutter/material.dart';
import 'package:project/features/staff/staff_router.dart';
import 'package:project/shared/routing/app_router.dart';
import 'package:project/shared/theme/app_theme.dart';
import 'package:project/shared/theme/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeController.isDark,
      builder: (context, isDark, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: isDark ? AppTheme.dark : AppTheme.light,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
