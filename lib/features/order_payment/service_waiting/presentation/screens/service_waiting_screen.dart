import 'package:flutter/material.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import '../widgets/service_waiting_header.dart';
import '../widgets/search_animation.dart';
import '../widgets/wait_time_display.dart';
import '../widgets/service_icons_row.dart';
import '../widgets/cancel_request_button.dart';
import '../widgets/help_contact_link.dart';

class ServiceWaitingScreen extends StatefulWidget {
  const ServiceWaitingScreen({super.key});

  @override
  State<ServiceWaitingScreen> createState() => _ServiceWaitingScreenState();
}

class _ServiceWaitingScreenState extends State<ServiceWaitingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const ServiceWaitingHeader(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              // Title
              const Text(
                'Đang tìm kiếm dịch vụ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontFamily: 'Quicksand',
                ),
              ),
              const SizedBox(height: 32),
              // Search Animation
              SearchAnimation(rotationAnimation: _rotationAnimation),
              const SizedBox(height: 24),
              // Wait Time
              const WaitTimeDisplay(),
              const SizedBox(height: 24),
              // Service Icons
              const ServiceIconsRow(),
              const SizedBox(height: 24),
              // Cancel Button
              const CancelRequestButton(),
              const SizedBox(height: 16),
              // Help Link
              const HelpContactLink(),
              const SizedBox(height: 24),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(
          currentIndex: 0,
        ),
      ),
    );
  }
}

