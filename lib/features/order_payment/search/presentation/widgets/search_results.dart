import 'package:flutter/material.dart' hide FilterChip;
import '../../data/models/search_result.dart';
import 'filter_chip.dart';
import 'search_result_card.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
    required this.results,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  final List<SearchResult> results;
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter Chips
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              FilterChip(
                label: 'Tất cả',
                isSelected: selectedFilter == 'Tất cả',
                onTap: () => onFilterChanged('Tất cả'),
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: 'Dịch vụ',
                isSelected: selectedFilter == 'Dịch vụ',
                onTap: () => onFilterChanged('Dịch vụ'),
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: 'Nhà cung cấp',
                isSelected: selectedFilter == 'Nhà cung cấp',
                onTap: () => onFilterChanged('Nhà cung cấp'),
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: 'Giá ↑',
                isSelected: selectedFilter == 'Giá ↑',
                onTap: () => onFilterChanged('Giá ↑'),
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: 'Đánh giá',
                isSelected: selectedFilter == 'Đánh giá',
                onTap: () => onFilterChanged('Đánh giá'),
              ),
            ],
          ),
        ),
        // Results List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: results.length,
            itemBuilder: (context, index) {
              return SearchResultCard(result: results[index]);
            },
          ),
        ),
      ],
    );
  }
}

