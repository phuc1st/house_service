import 'package:flutter/material.dart';
import '../../data/models/service_detail.dart';
import 'included_service_item.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    super.key,
    required this.serviceDetail,
  });

  final ServiceDetail serviceDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          // Service Description Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mô tả dịch vụ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    letterSpacing: -0.36,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  serviceDetail.description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87,
                    height: 1.36,
                    letterSpacing: -0.07,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Included Services Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bao gồm',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: -0.07,
                  ),
                ),
                const SizedBox(height: 16),
                ...serviceDetail.includedServices.map((service) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: IncludedServiceItem(serviceName: service),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

