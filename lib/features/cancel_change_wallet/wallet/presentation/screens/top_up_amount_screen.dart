import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/cancel_change_wallet/wallet/wallet_router.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';
import 'package:intl/intl.dart';
import '../widgets/top_up_source_modal.dart';
import '../widgets/top_up_confirm_modal.dart';

class TopUpAmountScreen extends StatefulWidget {
  const TopUpAmountScreen({super.key});

  @override
  State<TopUpAmountScreen> createState() => _TopUpAmountScreenState();
}

class _TopUpAmountScreenState extends State<TopUpAmountScreen> {
  final TextEditingController _amountController = TextEditingController();
  int? _selectedAmount;

  final List<int> _presetAmounts = [
    100000,
    200000,
    500000,
    10000,
    20000,
    50000,
  ];

  @override
  void initState() {
    super.initState();
    _amountController.text = '100.000';
    _selectedAmount = 100000;
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  String _formatAmount(int amount) {
    // Format with dot as thousand separator (e.g., 100.000)
    final formatter = NumberFormat('#,###', 'vi_VN');
    return formatter.format(amount).replaceAll(',', '.');
  }

  int? _parseAmount(String text) {
    final cleaned = text.replaceAll('.', '').replaceAll(',', '');
    return int.tryParse(cleaned);
  }

  void _onAmountSelected(int amount) {
    setState(() {
      _selectedAmount = amount;
      _amountController.text = _formatAmount(amount);
    });
  }

  void _onAmountChanged(String value) {
    final amount = _parseAmount(value);
    if (amount != null) {
      setState(() {
        _selectedAmount = _presetAmounts.contains(amount) ? amount : null;
      });
    } else {
      setState(() {
        _selectedAmount = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppHeader(
          title: 'Nạp tiền',
          backgroundColor: Colors.transparent,
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            color: Colors.black87,
            onPressed: () {
              // Handle menu
            },
          ),
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
                    // Amount label
                    const Text(
                      'Số tiền',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Amount input field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            if (newValue.text.isEmpty) {
                              return newValue;
                            }
                            final amount = int.tryParse(newValue.text);
                            if (amount != null) {
                              final formatted = _formatAmount(amount);
                              return TextEditingValue(
                                text: formatted,
                                selection: TextSelection.collapsed(
                                  offset: formatted.length,
                                ),
                              );
                            }
                            return newValue;
                          }),
                        ],
                        onChanged: _onAmountChanged,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          suffixText: 'đ',
                          suffixStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Preset amount buttons
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 2.5,
                      ),
                      itemCount: _presetAmounts.length,
                      itemBuilder: (context, index) {
                        final amount = _presetAmounts[index];
                        final isSelected = _selectedAmount == amount;
                        return InkWell(
                          onTap: () => _onAmountSelected(amount),
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFB23D0A)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFFB23D0A)
                                    : Colors.grey.shade300,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                _formatAmount(amount),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        );
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
                    _showSourceModal(context);
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

  void _showSourceModal(BuildContext context) {
    final amount = _parseAmount(_amountController.text) ?? 0;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return TopUpSourceModal(
          amount: amount,
          onConfirm: () {
            Navigator.of(context).pop();
            // Show confirm modal
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return TopUpConfirmModal(
                  amount: amount,
                  
                );
              },
            );
          },
          onAddNewLink: () {
            Navigator.of(context).pop();
            // TODO: Navigate to add new bank link screen
          },
        );
      },
    );
  }
}

