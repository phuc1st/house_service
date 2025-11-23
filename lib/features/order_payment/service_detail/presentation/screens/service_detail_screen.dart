import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/order_payment/order_payment_router.dart';
import 'package:project/shared/routing/app_router.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';
import '../../data/service_detail_mock_data.dart';
import '../widgets/profile_section.dart';
import '../widgets/content_card.dart';
import '../widgets/more_options_bottom_sheet.dart';

class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppHeader(
          title: 'Chi tiết dịch vụ',
          backgroundColor: Colors.transparent,
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            color: Colors.black87,
            onPressed: () {
              _showMoreOptions(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Section
              ProfileSection(serviceDetail: mockServiceDetail),
              // Content Card
              ContentCard(serviceDetail: mockServiceDetail),
              const SizedBox(height: 16),
              // Book Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: AppPrimaryButton(
                  label: 'Đặt lịch ngay',
                  onPressed: () {
                    context.push(OrderPaymentRouter.booking);
                  },
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(
          currentIndex: 0,
        ),
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const MoreOptionsBottomSheet(),
    );
  }
}

