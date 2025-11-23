import 'package:flutter/material.dart' hide SearchBar;
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import '../widgets/search_bar.dart';
import '../widgets/service_category_chips.dart';
import '../widgets/filter_chips.dart';
import '../widgets/search_results_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String? _selectedLocation;
  String? _selectedTime;
  String? _selectedCategory;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _onLocationSelected(String? location) {
    setState(() {
      _selectedLocation = location;
    });
  }

  void _onTimeSelected(String? time) {
    setState(() {
      _selectedTime = time;
    });
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category.isEmpty ? null : category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SearchBar(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                ),
              ),
              const SizedBox(height: 16),
              // Service Category Chips
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ServiceCategoryChips(
                  onCategorySelected: _onCategorySelected,
                ),
              ),
              const SizedBox(height: 16),
              // Filter Chips
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FilterChips(
                  selectedLocation: _selectedLocation,
                  selectedTime: _selectedTime,
                  onLocationSelected: _onLocationSelected,
                  onTimeSelected: _onTimeSelected,
                ),
              ),
              const SizedBox(height: 16),
              // Search Results
              Expanded(
                child: SearchResultsList(
                  searchQuery: _searchQuery,
                  location: _selectedLocation,
                  category: _selectedCategory,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(
          currentIndex: 0,
        ),
      ),
    );
  }
}
