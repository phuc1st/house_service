import 'package:flutter/material.dart';
import '../../data/models/booking_detail.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({
    super.key,
    required this.bookingDetail,
    this.onChangeAddress,
  });

  final BookingDetail bookingDetail;
  final VoidCallback? onChangeAddress;

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
                Icons.location_on,
                size: 20,
                color: Colors.red,
              ),
              const SizedBox(width: 8),
              const Text(
                'Địa chỉ làm việc',
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookingDetail.address,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      bookingDetail.addressDetail,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: onChangeAddress,
                child: const Text(
                  'Đổi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFB23D0A),
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

