import 'package:flutter/material.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({
    super.key,
    this.selectedLocation,
    this.selectedTime,
    this.onLocationSelected,
    this.onTimeSelected,
    this.onFilterSort,
  });

  final String? selectedLocation;
  final String? selectedTime;
  final ValueChanged<String?>? onLocationSelected;
  final ValueChanged<String?>? onTimeSelected;
  final VoidCallback? onFilterSort;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Location Filter
          _FilterChip(
            label: selectedLocation != null
                ? 'Địa điểm : $selectedLocation'
                : 'Địa điểm : Hải Châu, Đà Nẵng',
            icon: Icons.location_on,
            isSelected: false,
            onTap: () {
              _showLocationPicker(context);
            },
          ),
          const SizedBox(width: 12),
          // Time Filter
          _FilterChip(
            label: selectedTime != null
                ? 'Thời gian : $selectedTime'
                : 'Thời gian : Hôm nay, 10:00 - 12:00',
            icon: Icons.access_time,
            isSelected: false,
            onTap: () {
              _showTimePicker(context);
            },
          ),
          const SizedBox(width: 12),
          // Filter & Sort
          _FilterChip(
            label: 'Lọc & sắp xếp',
            icon: Icons.tune,
            isSelected: true,
            onTap: () {
              onFilterSort?.call();
            },
          ),
        ],
      ),
    );
  }

  void _showLocationPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chọn địa điểm',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _LocationOption(
              location: 'Hải Châu, Đà Nẵng',
              onTap: () {
                Navigator.pop(context);
                onLocationSelected?.call('Hải Châu, Đà Nẵng');
              },
            ),
            const SizedBox(height: 12),
            _LocationOption(
              location: '470 Trần Đại Nghĩa',
              onTap: () {
                Navigator.pop(context);
                onLocationSelected?.call('470 Trần Đại Nghĩa');
              },
            ),
            const SizedBox(height: 12),
            _LocationOption(
              location: 'Gần tôi',
              onTap: () {
                Navigator.pop(context);
                onLocationSelected?.call('Gần tôi');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chọn thời gian',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _TimeOption(
              time: 'Hôm nay, 10:00 - 12:00',
              onTap: () {
                Navigator.pop(context);
                onTimeSelected?.call('Hôm nay, 10:00 - 12:00');
              },
            ),
            const SizedBox(height: 12),
            _TimeOption(
              time: 'Hôm nay, 14:00 - 16:00',
              onTap: () {
                Navigator.pop(context);
                onTimeSelected?.call('Hôm nay, 14:00 - 16:00');
              },
            ),
            const SizedBox(height: 12),
            _TimeOption(
              time: 'Ngày mai, 09:00 - 11:00',
              onTap: () {
                Navigator.pop(context);
                onTimeSelected?.call('Ngày mai, 09:00 - 11:00');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFAA3C) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.white : Colors.black87,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationOption extends StatelessWidget {
  const _LocationOption({
    required this.location,
    required this.onTap,
  });

  final String location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            const Icon(
              Icons.location_on,
              color: Color(0xFFFFAA3C),
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              location,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeOption extends StatelessWidget {
  const _TimeOption({
    required this.time,
    required this.onTap,
  });

  final String time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            const Icon(
              Icons.access_time,
              color: Color(0xFFFFAA3C),
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

