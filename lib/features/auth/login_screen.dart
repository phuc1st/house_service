import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/order_payment/order_payment_router.dart';
import 'package:project/shared/routing/app_router.dart';
import 'package:project/shared/widgets/app_primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    final obscurePassword = ValueNotifier<bool>(true);
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFFFE4D1), Color(0xFFE4F0FF)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Close button
              Positioned(
                top: 16,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black87),
                  onPressed: () {
                    context.go(AppRouter.welcome);
                  },
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 60),
                    // Title
                    const Text(
                      'DaNaHouse',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB23D0A),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Subtitle
                    Text(
                      'Một cách dễ dàng để mọi người kết nối với nhau',
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.colorScheme.secondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 48),
                    // Phone input
                    TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: '0399613809',
                        hintStyle: const TextStyle(color: Color(0xFFB23D0A)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFB23D0A),
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),
                    // Password input
                    ValueListenableBuilder<bool>(
                      valueListenable: obscurePassword,
                      builder: (context, isObscure, child) {
                        return TextField(
                          controller: passwordController,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            hintText: 'abcdefgh',
                            hintStyle: const TextStyle(
                              color: Color(0xFFB23D0A),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFFB23D0A),
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.grey.shade600,
                              ),
                              onPressed: () {
                                obscurePassword.value =
                                    !obscurePassword.value;
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    // Login button
                    AppPrimaryButton(
                      label: 'Đăng Nhập',
                      onPressed: () {
                        context.go(OrderPaymentRouter.home);
                      },
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    const SizedBox(height: 16),
                    // Forgot password link
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Handle forgot password
                        },
                        child: Text(
                          'quên mật khẩu',
                          style: TextStyle(
                            fontSize: 14,
                            color:theme.colorScheme.secondary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
