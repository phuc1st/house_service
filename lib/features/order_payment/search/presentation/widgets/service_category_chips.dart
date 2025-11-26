import 'package:flutter/material.dart';

class ServiceCategoryChips extends StatefulWidget {
  const ServiceCategoryChips({
    super.key,
    this.onCategorySelected,
  });

  final ValueChanged<String>? onCategorySelected;

  @override
  State<ServiceCategoryChips> createState() => _ServiceCategoryChipsState();
}

class _ServiceCategoryChipsState extends State<ServiceCategoryChips> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _CategoryChip(
            label: 'Dọn dẹp nhà cửa',
            icon: Icons.cleaning_services,
            isSelected: _selectedCategory == 'Dọn dẹp nhà cửa',
            onTap: () {
              setState(() {
                _selectedCategory = _selectedCategory == 'Dọn dẹp nhà cửa'
                    ? null
                    : 'Dọn dẹp nhà cửa';
              });
              widget.onCategorySelected?.call(_selectedCategory ?? '');
            },
          ),
          const SizedBox(width: 12),
          _CategoryChip(
            label: 'Sửa điện nước',
            icon: Icons.build,
            isSelected: _selectedCategory == 'Sửa điện nước',
            onTap: () {
              setState(() {
                _selectedCategory = _selectedCategory == 'Sửa điện nước'
                    ? null
                    : 'Sửa điện nước';
              });
              widget.onCategorySelected?.call(_selectedCategory ?? '');
            },
          ),
          const SizedBox(width: 12),
          _CategoryChip(
            label: 'Chăm sóc cây',
            icon: Icons.local_florist,
            isSelected: _selectedCategory == 'Chăm sóc cây',
            onTap: () {
              setState(() {
                _selectedCategory = _selectedCategory == 'Chăm sóc cây'
                    ? null
                    : 'Chăm sóc cây';
              });
              widget.onCategorySelected?.call(_selectedCategory ?? '');
            },
          ),
          const SizedBox(width: 12),
          _CategoryChip(
            label: 'Xem tất cả',
            icon: Icons.grid_view,
            isSelected: _selectedCategory == 'Xem tất cả',
            onTap: () {
              setState(() {
                _selectedCategory = _selectedCategory == 'Xem tất cả'
                    ? null
                    : 'Xem tất cả';
              });
              widget.onCategorySelected?.call(_selectedCategory ?? '');
            },
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
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


