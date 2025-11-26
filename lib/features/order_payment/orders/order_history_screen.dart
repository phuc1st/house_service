import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/order_payment/order_payment_router.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {
        'id': '1',
        'name': 'Nguyễn Thị Thương',
        'service': 'Giặt giữ quần áo',
        'price': '200.000 đ',
        'date': '25 / 11 / 2025',
      },
      {
        'id': '2',
        'name': 'Nguyễn Thị Tâm',
        'service': 'Giặt giữ quần áo',
        'price': '200.000 đ',
        'date': '23 / 11 / 2025',
      },
      {
        'id': '3',
        'name': 'Anh Nguyễn Văn Phúc',
        'service': 'Sửa điện nước',
        'price': '200.000 đ',
        'date': '20 / 11 / 2025',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text('Lịch sử đơn hàng', style: TextStyle(color: Colors.black87)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = orders[index];
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: const AssetImage('images/home/avatar.png'),
                  backgroundColor: Colors.grey.shade200,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(item['service']!, style: TextStyle(color: Colors.grey.shade600)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(item['price']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFB23D0A))),
                          const SizedBox(width: 12),
                          Text(item['date']!, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Xem chi tiết -> chuyển tới screen chi tiết
                        context.go(OrderPaymentRouter.orderDetails);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFA726)),
                      child: const Text('Xem chi tiết'),
                    ),
                    const SizedBox(height: 6),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Đánh giá ngay'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
