import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/cancel_change_wallet/wallet/wallet_router.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';
import '../widgets/payment_method_option.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  String? _selectedPaymentMethod;

  @override
  void initState() {
    super.initState();
    _selectedPaymentMethod = 'linked_bank';
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppHeader(
          title: 'Nạp tiền',
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    // Section title
                    const Text(
                      'Thanh toán bằng',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Payment method options
                    PaymentMethodOption(
                      label: 'Ngân hàng liên kết',
                      isSelected: _selectedPaymentMethod == 'linked_bank',
                      onTap: () {
                        setState(() {
                          _selectedPaymentMethod = 'linked_bank';
                        });
                      },
                    ),
                    PaymentMethodOption(
                      label: 'Chuyển khoản',
                      isSelected: _selectedPaymentMethod == 'bank_transfer',
                      onTap: () {
                        setState(() {
                          _selectedPaymentMethod = 'bank_transfer';
                        });
                      },
                    ),
                    PaymentMethodOption(
                      label: 'Thêm ngân hàng liên kết',
                      isSelected: false,
                      isAddButton: true,
                      onTap: () {
                        // Handle add linked bank
                        // TODO: Implement add linked bank
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Continue button
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: AppPrimaryButton(
                  label: 'Tiếp tục',
                  onPressed: () {
                    if (_selectedPaymentMethod == 'linked_bank') {
                      context.push(WalletRouter.topUpAmount);
                    } else if (_selectedPaymentMethod == 'bank_transfer') {
                      context.push(WalletRouter.topUpTransfer);
                    }
                  },
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

