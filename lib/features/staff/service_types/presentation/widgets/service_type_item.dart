import 'package:flutter/material.dart';
import '../../data/models/service_type.dart';

class ServiceTypeItem extends StatelessWidget {
  const ServiceTypeItem({
    super.key,
    required this.serviceType,
    required this.onToggle,
  });

  final ServiceType serviceType;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Service name
          Expanded(
            child: Text(
              serviceType.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
                fontFamily: 'Quicksand',
              ),
            ),
          ),
          // Toggle switch
          Switch(
            value: serviceType.isEnabled,
            onChanged: onToggle,
            activeColor: Colors.green,
            inactiveThumbColor: Colors.grey.shade300,
            inactiveTrackColor: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }
}

