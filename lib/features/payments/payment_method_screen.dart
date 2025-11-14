import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:project/shared/routing/app_router.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String _selectedMethod = 'card';

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppHeader(
          title: 'Chọn thanh toán',
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 24,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Thanh toán bằng',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _PaymentMethodTile(
                            groupValue: _selectedMethod,
                            value: 'card',
                            label: 'Thẻ tín dụng/ghi nợ',
                            icon: Icons.credit_card,
                            onChanged: _onMethodChanged,
                          ),
                          const SizedBox(height: 12),
                          _PaymentMethodTile(
                            groupValue: _selectedMethod,
                            value: 'ewallet',
                            label: 'Ví điện tử (MoMo)',
                            icon: Icons.account_balance_wallet_outlined,
                            onChanged: _onMethodChanged,
                          ),
                          const SizedBox(height: 12),
                          _PaymentMethodTile(
                            groupValue: _selectedMethod,
                            value: 'cod',
                            label: 'Thanh toán khi hoàn thành COD',
                            icon: Icons.local_shipping_outlined,
                            onChanged: _onMethodChanged,
                          ),
                          const SizedBox(height: 16),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size.fromHeight(60),
                              foregroundColor: Colors.grey.shade600,
                              side: BorderSide(
                                color: Colors.grey.shade300,
                                style: BorderStyle.solid,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.add, size: 22),
                            label: const Text(
                              'Thêm phương thức mới',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Tổng cộng',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          '200.000 VNĐ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    AppPrimaryButton(
                      label: 'Xác nhận và thanh toán',
                      onPressed: () {
                        context.go(AppRouter.paymentSuccess);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onMethodChanged(String? value) {
    if (value != null) {
      setState(() {
        _selectedMethod = value;
      });
    }
  }
}

class _PaymentMethodTile extends StatelessWidget {
  const _PaymentMethodTile({
    required this.groupValue,
    required this.value,
    required this.label,
    required this.icon,
    required this.onChanged,
    this.subtitle,
  });

  final String groupValue;
  final String value;
  final String label;
  final String? subtitle;
  final IconData icon;
  final ValueChanged<String?> onChanged;

  static const Color _brandOrange = Color(0xFFCB5B17);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF3E6) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? _brandOrange : Colors.grey.shade300,
            width: 1.4,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? _brandOrange : Colors.grey.shade500,
                  width: 1.8,
                ),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? _brandOrange : Colors.transparent,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Icon(
              icon,
              color: Colors.grey.shade600,
              size: 26,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

