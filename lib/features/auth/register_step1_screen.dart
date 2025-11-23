import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/shared/routing/app_router.dart';
import 'package:project/shared/widgets/app_primary_button.dart';

class RegisterStep1Screen extends StatelessWidget {
  const RegisterStep1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final genderController = TextEditingController();

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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 400),
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Close button
                    Positioned(
                      top: 16,
                      right: 16,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.grey),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    // Content
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          // Title
                          const Text(
                            'DaNaHouse',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB23D0A),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Subtitle
                          const Text(
                            'MaroMart, cách dễ dàng để mọi người mua, bán và kết nối với nhau.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFB23D0A),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Name input
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Họ và tên...',
                              hintStyle: const TextStyle(
                                color: Color(0xFFB23D0A),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Email input
                          TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Email...',
                              hintStyle: const TextStyle(
                                color: Color(0xFFB23D0A),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Phone input
                          TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Số điện thoại...',
                              hintStyle: const TextStyle(
                                color: Color(0xFFB23D0A),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Gender input
                          TextField(
                            controller: genderController,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Giới tính...',
                              hintStyle: const TextStyle(
                                color: Color(0xFFB23D0A),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xFFB23D0A),
                              ),
                            ),
                            onTap: () {
                              _showGenderPicker(context, genderController);
                            },
                          ),
                          const SizedBox(height: 32),
                          // Continue button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                context.push(AppRouter.registerStep2);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFE4D1),
                                foregroundColor: const Color(0xFFB23D0A),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Tiếp'),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward, size: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showGenderPicker(
      BuildContext context, TextEditingController controller) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Nam'),
                onTap: () {
                  controller.text = 'Nam';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Nữ'),
                onTap: () {
                  controller.text = 'Nữ';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Khác'),
                onTap: () {
                  controller.text = 'Khác';
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

