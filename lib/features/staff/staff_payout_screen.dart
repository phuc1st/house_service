import 'package:flutter/material.dart';

import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';
import 'package:project/shared/widgets/staff_bottom_navigation_bar.dart';

class StaffPayoutScreen extends StatefulWidget {
  const StaffPayoutScreen({super.key});

  @override
  State<StaffPayoutScreen> createState() => _StaffPayoutScreenState();
}

class _StaffPayoutScreenState extends State<StaffPayoutScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _selectedAccount = 'Bank...4321';

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppHeader(
          title: 'Yêu cầu rút tiền',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              // Available Balance Card
              _buildAvailableBalanceCard(),
              const SizedBox(height: 16),
              // Withdrawal Amount Card
              _buildWithdrawalAmountCard(),
              const SizedBox(height: 16),
              // Recipient Account Card
              _buildRecipientAccountCard(),
              const SizedBox(height: 16),
              // Withdrawal Summary Card
              _buildWithdrawalSummaryCard(),
              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: const StaffBottomNavigationBar(
          currentIndex: 2,
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            child: AppPrimaryButton(
              label: 'Xác nhận rút tiền',
              onPressed: () {
                // Handle confirm withdrawal
              },
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvailableBalanceCard() {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
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
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWithdrawalAmountCard() {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Số tiền muốn rút',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '0.00',
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              setState(() {
                _amountController.text = '3000003000';
              });
            },
            child: const Text(
              'Rút toàn bộ số dư',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFB23D0A),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipientAccountCard() {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tài khoản nhận tiền',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          RadioListTile<String>(
            value: 'Bank...4321',
            groupValue: _selectedAccount,
            onChanged: (value) {
              setState(() {
                _selectedAccount = value!;
              });
            },
            title: const Text(
              'Bank...4321',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            subtitle: const Text(
              'Vietcombank',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            activeColor: const Color(0xFFB23D0A),
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () {
              // Handle add new method
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black87,
              side: BorderSide(
                color: Colors.grey[300]!,
                style: BorderStyle.solid,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.add, size: 20),
            label: const Text(
              'Thêm phương thức mới',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWithdrawalSummaryCard() {
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
      child: Column(
        children: [
          _buildSummaryRow('Số tiền rút', '1.005.000 VNĐ'),
          const SizedBox(height: 12),
          _buildSummaryRow('Phí giao dịch', '5.000 VNĐ'),
          const Divider(height: 24),
          _buildSummaryRow(
            'Thực nhận',
            '1.000.000 VNĐ',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 20 : 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

