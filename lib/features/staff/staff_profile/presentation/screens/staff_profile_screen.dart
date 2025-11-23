import 'package:flutter/material.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/staff_bottom_navigation_bar.dart';
import '../../data/staff_profile_mock_data.dart';
import '../widgets/profile_header.dart';
import '../widgets/contact_section.dart';
import '../widgets/professional_description_section.dart';
import '../widgets/performance_overview_section.dart';
import '../widgets/pricing_section.dart';
import '../widgets/skills_section.dart';

class StaffProfileScreen extends StatelessWidget {
  const StaffProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppHeader(
          title: 'Hồ sơ',
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Profile Header
              ProfileHeader(profile: mockStaffProfile),
              const SizedBox(height: 16),
              // Contact Section
              ContactSection(profile: mockStaffProfile),
              const SizedBox(height: 8),
              // Professional Description Section
              ProfessionalDescriptionSection(profile: mockStaffProfile),
              const SizedBox(height: 8),
              // Performance Overview Section
              PerformanceOverviewSection(profile: mockStaffProfile),
              const SizedBox(height: 8),
              // Pricing Section
              PricingSection(profile: mockStaffProfile),
              const SizedBox(height: 16),
              // Skills Section
              SkillsSection(profile: mockStaffProfile),
              const SizedBox(height: 24),
            ],
          ),
        ),
        bottomNavigationBar: const StaffBottomNavigationBar(
          currentIndex: 3,
        ),
      ),
    );
  }
}


