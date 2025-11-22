import 'package:flutter/material.dart';
import '../../data/search_mock_data.dart';
import 'recent_search_chip.dart';
import 'popular_searches.dart';
import 'service_categories.dart';

class SearchEmptyState extends StatelessWidget {
  const SearchEmptyState({
    super.key,
    required this.recentSearches,
    required this.onSearchTap,
    required this.onCategoryTap,
  });

  final List<String> recentSearches;
  final ValueChanged<String> onSearchTap;
  final ValueChanged<String> onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recent Searches Section
          if (recentSearches.isNotEmpty) ...[
            const Text(
              'Tìm kiếm gần đây',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: recentSearches.map((search) {
                return RecentSearchChip(
                  search: search,
                  onTap: () => onSearchTap(search),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
          ],
          // Popular Searches Section
          const Text(
            'Tìm kiếm phổ biến',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          PopularSearches(onSearchTap: onSearchTap),
          const SizedBox(height: 24),
          // Categories Section
          const Text(
            'Danh mục dịch vụ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          ServiceCategories(onCategoryTap: onCategoryTap),
        ],
      ),
    );
  }
}

