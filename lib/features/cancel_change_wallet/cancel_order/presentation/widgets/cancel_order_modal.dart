import 'package:flutter/material.dart';
import '../../data/cancellation_reasons_data.dart';
import '../../data/models/cancellation_reason.dart';
import 'cancel_order_success_modal.dart';

class CancelOrderModal extends StatefulWidget {
  const CancelOrderModal({
    super.key,
    required this.onConfirm,
  });

  final Function(String reason, String? otherReason) onConfirm;

  @override
  State<CancelOrderModal> createState() => _CancelOrderModalState();
}

class _CancelOrderModalState extends State<CancelOrderModal> {
  String? _selectedReasonId;
  final TextEditingController _otherReasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set default selection to first option
    _selectedReasonId = cancellationReasons.first.id;
  }

  @override
  void dispose() {
    _otherReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF8DF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Lý do hủy công việc',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            // Radio buttons for reasons
            ...cancellationReasons.map((reason) => _buildReasonOption(reason)),
            const SizedBox(height: 16),
            // Other reason input field
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _otherReasonController,
                decoration: const InputDecoration(
                  hintText: 'Lý do khác...',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Confirm button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.onConfirm(
                    _selectedReasonId ?? '',
                    _otherReasonController.text.trim().isEmpty
                        ? null
                        : _otherReasonController.text.trim(),
                  );
                  Navigator.of(context).pop();
                  // Show success modal
                  _showSuccessModal(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB23D0A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Xác nhận',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReasonOption(CancellationReason reason) {
    final isSelected = _selectedReasonId == reason.id;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedReasonId = reason.id;
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Radio<String>(
                value: reason.id,
                groupValue: _selectedReasonId,
                onChanged: (value) {
                  setState(() {
                    _selectedReasonId = value;
                  });
                },
                activeColor: const Color(0xFF2196F3),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  reason.label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const CancelOrderSuccessModal();
      },
    );
  }
}

