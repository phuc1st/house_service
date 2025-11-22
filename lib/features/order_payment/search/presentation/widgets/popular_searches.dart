import 'package:flutter/material.dart';
import '../../data/search_mock_data.dart';

class PopularSearches extends StatelessWidget {
  const PopularSearches({
    super.key,
    required this.onSearchTap,
  });

  final ValueChanged<String> onSearchTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: popularSearches.map((search) {
        return InkWell(
          onTap: () => onSearchTap(search),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFB23D0A).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              search,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFFB23D0A),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

