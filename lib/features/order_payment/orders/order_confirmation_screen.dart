import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/order_payment/order_payment_router.dart';
import 'package:project/shared/routing/app_router.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  _OrderConfirmationScreenState createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  int _selectedIndex = 1; // Giả sử 'Activity' đang được chọn

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Định nghĩa các màu sắc
  static const Color kBackgroundColor = Color(0xFFFFFBF2);
  static const Color kButtonColor = Color(0xFFC65D25);
  static const Color kPriceColor = Color(0xFFE57300);
  static const Color kDiscountColor = Color(0xFF34A853);
  static const Color kApplyButtonBg = Color(0xFFFFEFE1);
  static const Color kApplyButtonText = Color(0xFFC65D25);
  static const Color kSecondaryTextColor = Colors.black54;
  static const Color kPrimaryTextColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // Thanh tiêu đề (App Bar)
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kPrimaryTextColor),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text(
          'Xác nhận đơn hàng',
          style: TextStyle(
            color: kPrimaryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: kPrimaryTextColor),
            onPressed: () {
              // Xử lý khi nhấn nút menu
            },
          ),
        ],
      ),
      // Thanh điều hướng dưới cùng (Bottom Navigation)
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Column(
        children: [
          // Nội dung cuộn được
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildServiceCard(),
                  const SizedBox(height: 16),
                  _buildVoucherCard(),
                  const SizedBox(height: 16),
                  _buildPaymentDetailsCard(),
                  const SizedBox(height: 16), // Thêm khoảng đệm ở cuối
                ],
              ),
            ),
          ),
          // Nút Tiếp tục thanh toán
          _buildContinueButton(),
        ],
      ),
    );
  }

  // Thẻ Dịch vụ
  Widget _buildServiceCard() {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.2),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icon dịch vụ (dùng placeholder)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://placehold.co/60x60/FFFBF2/C65D25?text=Icon', // Placeholder
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[200],
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Thông tin dịch vụ
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Dọn dẹp nhà cửa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: kPrimaryTextColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '10:00 - 12:00 T7 25 Th10',
                    style: TextStyle(
                      fontSize: 14,
                      color: kSecondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            // Giá dịch vụ
            const Text(
              '200.000 Đ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: kPriceColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Thẻ Mã giảm giá & Voucher
  Widget _buildVoucherCard() {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.2),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mã giảm giá & Voucher',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: kPrimaryTextColor,
              ),
            ),
            const SizedBox(height: 12),
            // Ô nhập mã và nút Áp dụng
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Nhập mã giảm giá của bạn',
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: kButtonColor),
                      ),
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý áp dụng voucher
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kApplyButtonBg,
                    foregroundColor: kApplyButtonText,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: const Text(
                    'Áp dụng',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Thông tin đã áp dụng
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: kDiscountColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Đã áp dụng “PU10”',
                    style: TextStyle(
                      color: kDiscountColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '-20.000 VNĐ',
                    style: TextStyle(
                      color: kDiscountColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Thẻ Chi tiết thanh toán
  Widget _buildPaymentDetailsCard() {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.2),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chi tiết thanh toán',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: kPrimaryTextColor,
              ),
            ),
            const SizedBox(height: 12),
            _buildPaymentDetailRow('Phí dịch vụ (2 giờ)', '200.000 VNĐ'),
            const SizedBox(height: 8),
            _buildPaymentDetailRow('Phí dịch vụ', '20.000 VNĐ'),
            const SizedBox(height: 8),
            _buildPaymentDetailRow(
              'Giảm giá (PU10)',
              '-20.000 VNĐ',
              valueColor: kDiscountColor,
              labelColor: kDiscountColor,
            ),
            const Divider(
              height: 32,
              thickness: 1,
              color: Color(0xFFEEEEEE),
            ),
            // Tổng cộng
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Tổng cộng',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kPrimaryTextColor,
                  ),
                ),
                Text(
                  '200.000 VNĐ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kPrimaryTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget con cho một hàng chi tiết thanh toán
  Widget _buildPaymentDetailRow(String label, String value,
      {Color labelColor = kSecondaryTextColor,
      Color valueColor = kPrimaryTextColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: labelColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  // Nút Tiếp tục thanh toán
  Widget _buildContinueButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      color: kBackgroundColor, // Nền cùng màu với body
      child: ElevatedButton(
        onPressed: () {
          // Xử lý tiếp tục thanh toán -> Chuyển sang màn hình chọn thanh toán
          context.push(OrderPaymentRouter.paymentMethod);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kButtonColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 4,
          shadowColor: kButtonColor.withOpacity(0.4),
        ),
        child: const Text(
          'Tiếp tục thanh toán',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

