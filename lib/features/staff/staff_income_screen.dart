import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:project/features/staff/staff_router.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';
import 'package:project/shared/widgets/staff_bottom_navigation_bar.dart';

class StaffIncomeScreen extends StatefulWidget {
  const StaffIncomeScreen({super.key});

  @override
  State<StaffIncomeScreen> createState() => _StaffIncomeScreenState();
}

class _StaffIncomeScreenState extends State<StaffIncomeScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Tuần này', 'Tháng này', 'Tất cả'];

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppHeader(
          title: 'Thu nhập của tôi',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              // Tabs
              _buildTabs(),
              const SizedBox(height: 24),
              // Available Balance Card
              _buildAvailableBalanceCard(),
              const SizedBox(height: 16),
              // Income Overview Card
              _buildIncomeOverviewCard(),
              const SizedBox(height: 16),
              // Transaction History
              _buildTransactionHistory(),
              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: const StaffBottomNavigationBar(
          currentIndex: 2,
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Row(
      children: List.generate(
        _tabs.length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _selectedTabIndex == index
                        ? const Color(0xFFB23D0A)
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                _tabs[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _selectedTabIndex == index
                      ? const Color(0xFFB23D0A)
                      : Colors.black54,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvailableBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE0B2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Số dư khả dụng',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '3.000.003.000 VNĐ',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          AppPrimaryButton(
            label: 'Yêu cầu rút tiền',
            onPressed: () {
              context.go(StaffRouter.payout);
            },
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeOverviewCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE0B2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tổng quan thu nhập',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          // Simple bar chart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBarChartItem('T2', 40, false),
              _buildBarChartItem('T3', 50, false),
              _buildBarChartItem('T4', 100, true),
              _buildBarChartItem('T5', 60, false),
              _buildBarChartItem('T6', 45, false),
              _buildBarChartItem('T7', 55, false),
              _buildBarChartItem('CN', 30, false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBarChartItem(String label, double height, bool isHighest) {
    return Column(
      children: [
        Container(
          width: 30,
          height: height,
          decoration: BoxDecoration(
            color: isHighest
                ? const Color(0xFFB23D0A)
                : const Color(0xFFFFF8E1),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lịch sử giao dịch',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        _buildTransactionItem(
          'Thanh toán đơn #8843',
          '25 Th10 2025, 12:05',
          '+ 200.000',
          isPositive: true,
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          'Rút tiền về Bank...4321',
          '24 Th10 2025, 09:30',
          '-200.000',
          isPositive: false,
        ),
      ],
    );
  }

  Widget _buildTransactionItem(
    String description,
    String dateTime,
    String amount,
    {required bool isPositive}
  ) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dateTime,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isPositive ? const Color(0xFF34A853) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

