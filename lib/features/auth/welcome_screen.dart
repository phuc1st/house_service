import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/shared/routing/app_router.dart';
import 'package:project/shared/widgets/app_primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFFE4F0),
              Color(0xFFFFE4D1),
              Color(0xFFE4F0FF),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                // Title
                const Text(
                  'Bắt Đầu',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB23D0A),
                  ),
                ),
                const SizedBox(height: 12),
                // Subtitle
                Text(
                  'Một cách dễ dàng để mọi người kết nối với nhau',
                  style: TextStyle(
                    fontSize: 16,
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2),
                // Illustration placeholder - sẽ thay bằng hình ảnh thực tế
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/welcome.png',
                    width: 350,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(flex: 2),
                // Create Account Button
                AppPrimaryButton(
                  label: 'Tạo Tài Khoản',
                  onPressed: () {
                    context.go(AppRouter.registerStep1);
                  },
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                const SizedBox(height: 16),
                // Login Link
                TextButton(
                  onPressed: () {
                    context.push(AppRouter.login);
                  },
                  child: const Text(
                    'Đăng Nhập',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFB23D0A),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Google Sign Up
                OutlinedButton.icon(
                  onPressed: () {
                    // Handle Google sign up
                  },
                  icon: Image.asset(
                    'images/google_logo.png',
                    width: 20,
                    height: 20,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.g_mobiledata,
                        size: 24,
                        color: Colors.black87,
                      );
                    },
                  ),
                  label: const Text(
                    'Đăng ký bằng google',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

