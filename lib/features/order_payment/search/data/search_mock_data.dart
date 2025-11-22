import 'package:flutter/material.dart';
import 'models/search_result.dart';
import 'models/service_category.dart';

// Recent searches
const List<String> recentSearches = [
  'Dọn dẹp nhà cửa',
  'Vệ sinh cửa sổ',
  'Giặt ủi',
];

// Popular searches
const List<String> popularSearches = [
  'Dọn dẹp nhà cửa',
  'Vệ sinh cửa sổ',
  'Giặt ủi',
  'Sửa chữa',
  'Nước',
  'Tạp hóa',
];

// Service categories
final List<ServiceCategory> serviceCategories = [
  const ServiceCategory(
    name: 'Dọn dẹp',
    icon: Icons.cleaning_services,
  ),
  const ServiceCategory(
    name: 'Giặt ủi',
    icon: Icons.local_laundry_service,
  ),
  const ServiceCategory(
    name: 'Sửa chữa',
    icon: Icons.build,
  ),
  const ServiceCategory(
    name: 'Nước',
    icon: Icons.water_drop,
  ),
  const ServiceCategory(
    name: 'Tạp hóa',
    icon: Icons.store,
  ),
];

// Filter options
const List<String> priceFilters = ['Tất cả', 'Dưới 100k', '100k - 200k', 'Trên 200k'];
const List<String> ratingFilters = ['Tất cả', '4.5+', '4.0+', '3.5+'];
const List<String> distanceFilters = ['Tất cả', 'Dưới 1km', '1-3km', 'Trên 3km'];

// Mock search results
List<SearchResult> getMockSearchResults() {
  return List.generate(
    5,
    (index) => SearchResult(
      name: 'Dịch vụ ${index + 1}',
      provider: 'Nhà cung cấp ${index + 1}',
      rating: 4.5 + (index * 0.1),
      price: '${(index + 1) * 50}.000 VNĐ',
      image: index % 2 == 0
          ? 'images/home/avatar.png'
          : 'images/home/avatar-2.png',
    ),
  );
}

