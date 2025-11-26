import 'package:flutter/material.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool showServices = true;

  final List<Map<String, String>> services = [
    {'title': 'Sửa chữa điện nước', 'price': 'Từ 150 000 VND', 'icon': 'tools'},
    {'title': 'Dọn dẹp nhà cửa', 'price': 'Từ 150 000 VND', 'icon': 'broom'},
    {'title': 'Sửa điện trong nhà', 'price': 'Từ 150 000 VND', 'icon': 'bolt'},
  ];

  final List<Map<String, String>> workers = [
    {'name': 'Anh Minh', 'price': 'Từ 150 000 VND', 'avatar': ''},
    {'name': 'Chị Mai Anh', 'price': 'Từ 150 000 VND', 'avatar': ''},
    {'name': 'Anh Hoàng', 'price': 'Từ 150 000 VND', 'avatar': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppHeader(
        title: 'Dịch vụ & Thợ yêu thích',
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => showServices = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: showServices ? Colors.orange.shade50 : Colors.white,
                            border: Border.all(color: Colors.orange.shade200),
                          ),
                          child: Center(child: Text('Dịch vụ yêu thích', style: TextStyle(color: showServices ? Colors.orange.shade700 : Colors.black54))),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => showServices = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: showServices ? Colors.white : Colors.orange.shade50,
                            border: Border.all(color: Colors.orange.shade200),
                          ),
                          child: Center(child: Text('Thợ yêu thích', style: TextStyle(color: showServices ? Colors.black54 : Colors.orange.shade700))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: showServices ? _buildServicesList() : _buildWorkersList(),
                ),
              ),
            ],
          ),
        ),
      bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 3),
    );
  }

  Widget _buildServicesList() {
    if (services.isEmpty) return _buildEmptyState('Không có dịch vụ yêu thích ?', 'Khám phá ngay');
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      itemCount: services.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) {
        final s = services[i];
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.build, color: Colors.orange),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(s['title']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Row(children: List.generate(5, (index) => const Icon(Icons.star, size: 14, color: Colors.amber))),
                      const SizedBox(height: 6),
                      Text(s['price']!, style: const TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.favorite, color: Colors.red)),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 245, 124, 0)),
                      child: const Text('Đặt lịch ngay'),
                    ),
                  ],
                  
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWorkersList() {
    if (workers.isEmpty) return _buildEmptyState('Không có thợ yêu thích ?', 'Khám phá ngay');
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      itemCount: workers.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) {
        final w = workers[i];
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(radius: 26, backgroundColor: Colors.blue.shade50, child: const Icon(Icons.person, color: Colors.blue)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(w['name']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Row(children: List.generate(5, (index) => const Icon(Icons.star, size: 14, color: Colors.amber))),
                      const SizedBox(height: 6),
                      Text(w['price']!, style: const TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.favorite, color: Colors.red)),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700),
                      child: const Text('Đặt lịch ngay'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(String title, String action) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward, color: Colors.orange),
            label: Text(action, style: const TextStyle(color: Colors.orange)),
          )
        ],
      ),
    );
  }
}
