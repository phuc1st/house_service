import 'package:flutter/material.dart';

class Room {
  final String id;
  final String name;
  final IconData icon;
  final String imageUrl;
  final int quantity;

  Room({
    required this.id,
    required this.name,
    required this.icon,
    required this.imageUrl,
    this.quantity = 1,
  });

  Room copyWith({
    String? id,
    String? name,
    IconData? icon,
    String? imageUrl,
    int? quantity,
  }) {
    return Room(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
    );
  }
}

