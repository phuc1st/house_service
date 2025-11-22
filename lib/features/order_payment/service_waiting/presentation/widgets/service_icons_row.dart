import 'package:flutter/material.dart';

class ServiceIconsRow extends StatelessWidget {
  const ServiceIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'icon': Icons.build,
        'label': 'sửa chữa',
      },
      {
        'icon': Icons.cleaning_services,
        'label': 'Dọn dẹp',
      },
      {
        'icon': Icons.electrical_services,
        'label': 'Điện',
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: services.asMap().entries.map((entry) {
        final index = entry.key;
        final service = entry.value;
        final isSelected = index == 1; // Dọn dẹp is selected

        return Column(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(
                left: index > 0 ? 20 : 0,
                right: index < services.length - 1 ? 20 : 0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFFFFAA3C).withOpacity(0.2)
                    : const Color(0xFFFFE4D1),
                border: Border.all(
                  color: const Color(0xFFFFAA3C),
                  width: 2,
                ),
              ),
              child: Icon(
                service['icon'] as IconData,
                size: 35,
                color: const Color(0xFFFFAA3C),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              service['label'] as String,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontFamily: 'Quicksand',
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

