import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Plus button
        GestureDetector(
          onTap: onIncrease,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: const Icon(
              Icons.add,
              size: 16,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(width: 8),
        // Quantity
        SizedBox(
          width: 40,
          child: Text(
            quantity.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontFamily: 'Quicksand',
            ),
          ),
        ),
        const SizedBox(width: 8),
        // Minus button
        GestureDetector(
          onTap: quantity > 0 ? onDecrease : null,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: quantity > 0 ? Colors.grey.shade200 : Colors.grey.shade100,
            ),
            child: Icon(
              Icons.remove,
              size: 16,
              color: quantity > 0 ? Colors.black87 : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}


