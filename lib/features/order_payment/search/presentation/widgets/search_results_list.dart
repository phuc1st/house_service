import 'package:flutter/material.dart';
import '../../data/search_mock_data.dart';
import 'search_result_card.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({
    super.key,
    required this.searchQuery,
    this.location,
    this.category,
  });

  final String searchQuery;
  final String? location;
  final String? category;

  @override
  Widget build(BuildContext context) {
    // Filter results based on search query, location, and category
    final filteredResults = mockSearchResults.where((result) {
      final matchesQuery = searchQuery.isEmpty ||
          result.providerName.toLowerCase().contains(searchQuery.toLowerCase()) ||
          result.serviceName.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesLocation = location == null || result.location == location;
      final matchesCategory = category == null ||
          category == 'Xem tất cả' ||
          result.serviceName.toLowerCase().contains(category!.toLowerCase());
      return matchesQuery && matchesLocation && matchesCategory;
    }).toList();

    if (filteredResults.isEmpty && (searchQuery.isNotEmpty || location != null || category != null)) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'Không tìm thấy kết quả',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Thử tìm kiếm với từ khóa khác',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        final result = filteredResults[index];
        return SearchResultCard(
          result: result,
        );
      },
    );
  }
}

