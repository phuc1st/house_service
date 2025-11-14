import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:project/features/staff/staff_router.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';
import 'package:project/shared/widgets/staff_bottom_navigation_bar.dart';

class StaffJobScreen extends StatefulWidget {
  const StaffJobScreen({super.key});

  @override
  State<StaffJobScreen> createState() => _StaffJobScreenState();
}

class _StaffJobScreenState extends State<StaffJobScreen> {
  int _selectedTabIndex = 0;

  final List<Map<String, dynamic>> _upcomingJobs = [
    {
      'label': 'Hôm nay',
      'labelColor': const Color(0xFFFFE0B2),
      'title': 'Dọn dẹp nhà cửa',
      'price': '200.000 Đ',
      'time': '10:00 - 12:00 (Hôm nay)',
      'location': '123 Hồ Chí Minh',
      'client': 'Huỳnh Trần Phạm Hoàng',
    },
    {
      'label': 'Ngày mai',
      'labelColor': Colors.grey[300]!,
      'title': 'Giặt giũ',
      'price': '200.000 Đ',
      'time': '10:00 - 12:00 (Ngày mai)',
      'location': '123 Hồ Chí Minh',
      'client': 'Huỳnh Trần Phạm Hoàng',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppHeader(
          title: 'Việc làm của tôi',
        ),
        body: Column(
          children: [
            // Tabs
            _buildTabs(),
            // Job list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _upcomingJobs.length,
                itemBuilder: (context, index) {
                  return _buildJobCard(_upcomingJobs[index]);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const StaffBottomNavigationBar(
          currentIndex: 1,
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = 0;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _selectedTabIndex == 0
                          ? const Color(0xFFB23D0A)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  'Sắp tới (3)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _selectedTabIndex == 0
                        ? const Color(0xFFB23D0A)
                        : Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = 1;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _selectedTabIndex == 1
                          ? const Color(0xFFB23D0A)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  'Lịch sử (12)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _selectedTabIndex == 1
                        ? const Color(0xFFB23D0A)
                        : Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard(Map<String, dynamic> job) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: job['labelColor'] as Color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  job['label'] as String,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Text(
                job['price'] as String,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB23D0A),
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          // Title and price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  job['title'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          // Job details
          _buildJobDetailRow(Icons.access_time, 'Thời gian', job['time'] as String),
          const SizedBox(height: 8),
          _buildJobDetailRow(Icons.location_on, 'Địa điểm', job['location'] as String),
          const SizedBox(height: 8),
          _buildJobDetailRow(Icons.person, 'Khách hàng', job['client'] as String),
          const SizedBox(height: 16),
          // View details button
          AppPrimaryButton(
            label: 'Xem chi tiết',
            onPressed: () {
              context.go(StaffRouter.jobDetail);
            },
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildJobDetailRow(IconData icon, String title, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 18),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}

