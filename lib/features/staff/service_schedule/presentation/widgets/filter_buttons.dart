import 'package:flutter/material.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  final String? selectedFilter;
  final ValueChanged<String?> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildFilterButton(
              label: 'Khung giờ vàng',
              isSelected: selectedFilter == 'golden',
              onTap: () => onFilterChanged(
                selectedFilter == 'golden' ? null : 'golden',
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildFilterButton(
              label: 'Khung giờ hiệu quả',
              isSelected: selectedFilter == 'effective',
              onTap: () => onFilterChanged(
                selectedFilter == 'effective' ? null : 'effective',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade50 : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.green : Colors.black87,
              fontFamily: 'Quicksand',
            ),
          ),
        ),
      ),
    );
  }
}


