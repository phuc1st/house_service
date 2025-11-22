import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/shared/routing/app_router.dart';
import 'package:project/features/order_payment/order_payment_router.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE4D1),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            _buildHeader(context),
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Service Categories Section
                    _buildServiceCategories(),
                    const SizedBox(height: 24),
                    // Recommended Providers Section
                    _buildRecommendedProviders(),
                    const SizedBox(height: 24),
                    // Promotional Banners Section
                    _buildPromotionalBanners(),
                    const SizedBox(height: 24),
                    // Customer Reviews Section
                    _buildCustomerReviews(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(
        currentIndex: 0,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFFFE4D1),
      child: Column(
        children: [
          // Location Row
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Color(0xFFB23D0A),
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Địa chỉ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFB23D0A),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFFB23D0A),
                size: 20,
              ),
              const Spacer(),
              // User Avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Address
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 28),
              child: Text(
                '470 Trần Đại Nghĩa',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Search Bar
          InkWell(
            onTap: () {
              context.go(OrderPaymentRouter.search);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Tìm kiếm',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(text: 'Làm cho nhà bạn '),
                      TextSpan(
                        text: 'SẠCH ĐẸP HƠN',
                        style: TextStyle(
                          color: Color(0xFFB23D0A),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Icon(
                Icons.star,
                color: Color(0xFFB23D0A),
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Categories Grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: [
              _buildCategoryCard(
                'Dọn dẹp nhà cửa',
                'images/home/don-dep.png',
              ),
              _buildCategoryCard(
                'Tạp hóa và nấu ăn',
                'images/home/tap-hoa.png',
              ),
              _buildCategoryCard(
                'Thợ sửa chữa',
                'images/home/sua-chua.png',
              ),
              _buildCategoryCard(
                'Hệ thống nước',
                'images/home/nuoc.png',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8DF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Text ở góc trái trên
          Positioned(
            top: 12,
            left: 12,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          // Image ở góc phải dưới
          Positioned(
            bottom: 8,
            right: 8,
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  width: 80,
                  height: 80,
                  child: Icon(
                    Icons.image_not_supported,
                    size: 40,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedProviders() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Đặt ngay!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8DF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFFB23D0A),
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Providers List
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 2,
            itemBuilder: (context, index) {
              return _buildProviderCard(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProviderCard(int index) {
    final providers = [
      {
        'name': 'Nguyễn Thị Tâm',
        'service': 'Dọn dẹp nhà cửa',
        'rating': 4.8,
        'jobs': 42,
        'price': '200K/Giờ',
      },
      {
        'name': 'Nguyễn Thị Linh',
        'service': 'Đầu bếp gia đình',
        'rating': 4.8,
        'jobs': 42,
        'price': '200K/Giờ',
      },
    ];

    final provider = providers[index];

    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Avatar
            ClipOval(
              child: Image.asset(
                index == 0 ? 'images/home/avatar.png' : 'images/home/avatar-2.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            // Availability Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFB23D0A).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Có sẵn',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFB23D0A),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Name
            Text(
              provider['name'] as String,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            // Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Color(0xFFB23D0A),
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '${provider['rating']}/5 (${provider['jobs']} việc)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Service
            Text(
              provider['service'] as String,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            const Spacer(),
            // Price
            Text(
              provider['price'] as String,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            // Book Button
            SizedBox(
              width: double.infinity,
              child: AppPrimaryButton(
                label: 'Đặt ngay',
                onPressed: () {},
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromotionalBanners() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: 120,
            child: AppPrimaryButton(
              label: 'Xem ngay!',
              onPressed: () {},
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Banners List
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 3,
            itemBuilder: (context, index) {
              return _buildPromoBanner(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPromoBanner(int index) {
    final banners = [
      {
        'color': const Color(0xFF4CAF50),
        'text': 'Giảm 30% cho dọn dẹp nhà cửa',
        'icon': Icons.cleaning_services,
      },
      {
        'color': const Color(0xFFE91E63),
        'text': 'Giảm 20% cho đồ điện tử',
        'icon': Icons.electrical_services,
      },
      {
        'color': const Color(0xFF2196F3),
        'text': 'Giảm 10% cho tạp hóa',
        'icon': Icons.shopping_basket,
      },
    ];

    final banner = banners[index];

    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            banner['color'] as Color,
            (banner['color'] as Color).withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                banner['text'] as String,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              banner['icon'] as IconData,
              size: 60,
              color: Colors.white.withOpacity(0.8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerReviews() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Đánh giá từ khách hàng khác',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB23D0A),
            ),
          ),
          const SizedBox(height: 16),
          // Reviews List
          ...List.generate(3, (index) => _buildReviewCard(index)),
        ],
      ),
    );
  }

  Widget _buildReviewCard(int index) {
    final reviews = [
      {
        'name': 'Anh Minh',
        'rating': 4,
        'comment': 'Sạch sẽ, tốt',
      },
      {
        'name': 'Anh Tùng',
        'rating': 5,
        'comment': 'Làm gọn gàng',
      },
      {
        'name': 'Chị A',
        'rating': 1,
        'comment': 'Còn bẩn',
      },
    ];

    final review = reviews[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 12),
          // Review Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review['name'] as String,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                // Rating Stars
                Row(
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      starIndex < (review['rating'] as int)
                          ? Icons.star
                          : Icons.star_border,
                      color: const Color(0xFFB23D0A),
                      size: 16,
                    );
                  }),
                ),
                const SizedBox(height: 4),
                Text(
                  review['comment'] as String,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          // Book Button
          SizedBox(
            width: 80,
            child: AppPrimaryButton(
              label: 'Đặt ngay',
              onPressed: () {},
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ],
      ),
    );
  }
}

