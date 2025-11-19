import 'package:flutter/material.dart';
import 'package:project/features/staff/staff_router.dart';
import 'package:project/shared/routing/app_router.dart';
import 'package:project/shared/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.light,
      routerConfig: AppRouter.router,
    );
  }
}
