import 'package:flutter/material.dart';

import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';

class ServicePackagesScreen extends StatefulWidget {
  const ServicePackagesScreen({super.key});

  @override
  State<ServicePackagesScreen> createState() => _ServicePackagesScreenState();
}

class _ServicePackagesScreenState extends State<ServicePackagesScreen> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = ['Dọn dẹp', 'Giặt ủi', 'Sân vườn'];

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppHeader(
          title: 'Gói dịch vụ',
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            color: Colors.black87,
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              // Top section
              _buildTopSection(),
              const SizedBox(height: 24),
              // Category tabs
              _buildCategoryTabs(),
              const SizedBox(height: 24),
              // Service packages
              _buildPackageCard(
                title: 'Gói "Sparkle"',
                description: 'Dọn dẹp cơ bản hàng tuần',
                price: '2.000.000 VNĐ/tháng',
                originalPrice: '\$125',
                savings: '20%',
                features: [
                  '4 lần dọn dẹp cơ bản (2 giờ/lần)',
                  'Linh hoạt đổi lịch',
                ],
                isPopular: false,
              ),
              const SizedBox(height: 16),
              _buildPackageCard(
                title: 'Gói "Deep Clean"',
                description: 'Dọn dẹp sâu 2 lần/tháng',
                price: '2.500.000 VNĐ/tháng',
                originalPrice: '\$200',
                savings: '25%',
                features: [
                  '2 lần dọn dẹp sâu (4 giờ/lần)',
                  'Bao gồm lau kính & bên trong tủ lạnh',
                  'Linh hoạt đổi lịch',
                ],
                isPopular: true,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(
          currentIndex: 0,
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tiết kiệm hơn với gói định kỳ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Chọn gói phù hợp nhất và để chúng tôi lo phần còn lại.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTabs() {
    return Row(
      children: List.generate(
        _categories.length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: index < _categories.length - 1 ? 8 : 0),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: _selectedCategoryIndex == index
                    ? const Color(0xFFB23D0A)
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  _categories[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _selectedCategoryIndex == index
                        ? Colors.white
                        : Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPackageCard({
    required String title,
    required String description,
    required String price,
    required String originalPrice,
    required String savings,
    required List<String> features,
    required bool isPopular,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge
              if (isPopular)
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB23D0A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Phổ biến nhất',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (isPopular) const SizedBox(height: 8),
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB23D0A),
                ),
              ),
              const SizedBox(height: 4),
              // Description
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              // Price
              Text(
                price,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              // Savings
              Text(
                'Tiết kiệm $savings (Giá gốc $originalPrice)',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF34A853),
                ),
              ),
              const SizedBox(height: 20),
              // Features
              ...features.map((feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFF34A853),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            feature,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 20),
              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle package selection
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPopular
                        ? const Color(0xFFB23D0A)
                        : const Color(0xFFFFE0B2),
                    foregroundColor: isPopular ? Colors.white : Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text('Chọn gói này'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

