import 'package:flutter/material.dart';
import 'package:project/shared/widgets/app_primary_button.dart';
import '../../data/search_mock_data.dart';
import 'filter_option.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bộ lọc',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          FilterOption(title: 'Giá', options: priceFilters),
          const SizedBox(height: 16),
          FilterOption(title: 'Đánh giá', options: ratingFilters),
          const SizedBox(height: 16),
          FilterOption(title: 'Khoảng cách', options: distanceFilters),
          const SizedBox(height: 24),
          AppPrimaryButton(
            label: 'Áp dụng',
            onPressed: () {
              Navigator.of(context).pop();
            },
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

