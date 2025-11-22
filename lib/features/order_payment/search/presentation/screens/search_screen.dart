import 'package:flutter/material.dart' hide SearchBar;
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import '../../data/search_mock_data.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_empty_state.dart';
import '../widgets/search_results.dart';
import '../widgets/filter_bottom_sheet.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedFilter = 'Tất cả';
  List<String> _recentSearches = List.from(recentSearches);

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppHeader(
          title: 'Tìm kiếm',
          backgroundColor: Colors.transparent,
          trailing: IconButton(
            icon: const Icon(Icons.filter_list),
            color: Colors.black87,
            onPressed: () {
              _showFilterBottomSheet(context);
            },
          ),
        ),
        body: Column(
          children: [
            // Search Bar Section
            SearchBar(
              controller: _searchController,
              searchQuery: _searchQuery,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              onSubmitted: (value) {
                if (value.isNotEmpty && !_recentSearches.contains(value)) {
                  setState(() {
                    _recentSearches.insert(0, value);
                    if (_recentSearches.length > 5) {
                      _recentSearches.removeLast();
                    }
                  });
                }
              },
              onClear: () {
                setState(() {
                  _searchController.clear();
                  _searchQuery = '';
                });
              },
            ),
            // Content
            Expanded(
              child: _searchQuery.isEmpty
                  ? SearchEmptyState(
                      recentSearches: _recentSearches,
                      onSearchTap: (search) {
                        setState(() {
                          _searchController.text = search;
                          _searchQuery = search;
                        });
                      },
                      onCategoryTap: (category) {
                        setState(() {
                          _searchController.text = category;
                          _searchQuery = category;
                        });
                      },
                    )
                  : SearchResults(
                      results: getMockSearchResults(),
                      selectedFilter: _selectedFilter,
                      onFilterChanged: (filter) {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                    ),
            ),
          ],
        ),
        bottomNavigationBar: const AppBottomNavigationBar(
          currentIndex: 0,
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const FilterBottomSheet(),
    );
  }
}

