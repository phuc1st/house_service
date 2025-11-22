import 'package:flutter/material.dart';
import '../../data/models/service_detail.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.serviceDetail,
  });

  final ServiceDetail serviceDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: Column(
        children: [
          // Avatar
          Container(
            width: 144,
            height: 141,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                serviceDetail.avatarImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Name
          Text(
            serviceDetail.providerName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: -0.36,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          // Service Type
          Text(
            serviceDetail.serviceType,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
              letterSpacing: -0.067,
            ),
          ),
          const SizedBox(height: 8),
          // Rating and Experience Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Rating
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 11,
                      color: Color(0xFFED8803),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '${serviceDetail.rating}/5',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFED8803),
                        letterSpacing: -0.067,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${serviceDetail.jobCount} việc)',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade700,
                        letterSpacing: -0.067,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                // Experience
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: Colors.black87,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      serviceDetail.experience,
                      style: TextStyle(
                        fontSize: 7.3,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade700,
                        letterSpacing: -0.045,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Price
          Text(
            serviceDetail.price,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: -0.36,
            ),
          ),
        ],
      ),
    );
  }
}

