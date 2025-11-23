import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';
import '../../data/profile_mock_data.dart';
import '../widgets/profile_card.dart';
import '../widgets/general_info_card.dart';
import '../widgets/introduction_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppHeader(
          title: 'Hồ sơ',
          backgroundColor: Colors.transparent,
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            color: Colors.black87,
            onPressed: () {
              // Handle more options
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              // Profile Card
              ProfileCard(profile: mockProfile),
              const SizedBox(height: 16),
              // General Info Card
              GeneralInfoCard(profile: mockProfile),
              const SizedBox(height: 16),
              // Introduction Card
              IntroductionCard(profile: mockProfile),
              const SizedBox(height: 24),
              // Book Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: AppPrimaryButton(
                  label: 'Đặt lịch ngay',
                  onPressed: () {
                    // Navigate to booking screen
                    context.push('/booking');
                  },
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
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


