import 'package:flutter/material.dart';

import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';

class ReportIncidentScreen extends StatefulWidget {
  const ReportIncidentScreen({super.key});

  @override
  State<ReportIncidentScreen> createState() => _ReportIncidentScreenState();
}

class _ReportIncidentScreenState extends State<ReportIncidentScreen> {
  String? _selectedOrder;
  String? _selectedProblem;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppHeader(
          title: 'Báo cáo sự cố',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              // Introductory message
              const Text(
                'Chúng tôi rất tiếc về trải nghiệm của bạn. Vui lòng cung cấp thông tin để chúng tôi hỗ trợ bạn ngay lập tức.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              // Order selection section
              _buildOrderSelectionCard(),
              const SizedBox(height: 16),
              // Problem selection section
              _buildProblemSelectionCard(),
              const SizedBox(height: 16),
              // Detailed description section
              _buildDescriptionCard(),
              const SizedBox(height: 16),
              // Upload evidence button
              _buildUploadButton(),
              const SizedBox(height: 24),
              // Submit button
              AppPrimaryButton(
                label: 'Gửi báo cáo',
                onPressed: () {
                  // Handle submit report
                },
                padding: const EdgeInsets.symmetric(vertical: 16),
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

  Widget _buildOrderSelectionCard() {
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
            'Chọn đơn hàng gặp sự cố',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {
              // Show order selection dialog
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedOrder ?? '#8454 - Dọn dẹp nhà cửa',
                    style: TextStyle(
                      fontSize: 16,
                      color: _selectedOrder == null
                          ? Colors.black54
                          : Colors.black87,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProblemSelectionCard() {
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
            'Vấn đề của bạn là gì?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.5,
            children: [
              _buildProblemOption('Dịch vụ không sạch', 'unclean'),
              _buildProblemOption('Nhân viên trễ giờ', 'late'),
              _buildProblemOption('Hư hỏng tài sản', 'damage'),
              _buildProblemOption('Vấn đề khác', 'other'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProblemOption(String label, String value) {
    final isSelected = _selectedProblem == value;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedProblem = value;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F5E9) : Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF2196F3)
                : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF2196F3)
                      : Colors.grey[500]!,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 14,
                      color: Color(0xFF2196F3),
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionCard() {
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
            'Mô tả chi tiết',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _descriptionController,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Vui lòng mô tả rõ vấn đề bạn gặp phải',
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadButton() {
    return OutlinedButton.icon(
      onPressed: () {
        // Handle upload image/video
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        side: BorderSide(
          color: Colors.grey[300]!,
          style: BorderStyle.solid,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: const Icon(Icons.camera_alt, size: 24),
      label: const Text(
        'Tải ảnh/Video bằng chứng',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

