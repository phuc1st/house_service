import 'package:flutter/material.dart';
import '../../data/models/booking_detail.dart';

class PriceSummarySection extends StatelessWidget {
  const PriceSummarySection({
    super.key,
    required this.bookingDetail,
  });

  final BookingDetail bookingDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.receipt,
                size: 20,
                color: Color(0xFFB23D0A),
              ),
              const SizedBox(width: 8),
              const Text(
                'Tóm Tắt giá',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Service price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Giá dịch vụ (${bookingDetail.duration} giờ x \$${bookingDetail.servicePricePerHour.toStringAsFixed(0)}/giờ)',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
              Text(
                '\$${bookingDetail.totalServicePrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Service fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Phí dịch vụ & Thuế (${bookingDetail.serviceFeePercent.toStringAsFixed(0)}%)',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
              Text(
                '\$${bookingDetail.serviceFee.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
          const Divider(height: 32),
          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tổng Thanh Toán',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Quicksand',
                ),
              ),
              Text(
                '\$${bookingDetail.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFAA3C),
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

