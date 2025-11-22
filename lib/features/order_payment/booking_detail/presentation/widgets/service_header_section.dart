import 'package:flutter/material.dart';
import '../../data/models/booking_detail.dart';

class ServiceHeaderSection extends StatelessWidget {
  const ServiceHeaderSection({
    super.key,
    required this.bookingDetail,
  });

  final BookingDetail bookingDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
            child: ClipOval(
              child: Image.network(
                bookingDetail.serviceProviderAvatar,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 20),
          // Service info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookingDetail.serviceName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Quicksand',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Mã đơn: ${bookingDetail.orderId}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withOpacity(0.5),
                    fontFamily: 'Quicksand',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

