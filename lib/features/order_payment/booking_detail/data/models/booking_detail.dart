import 'package:flutter/material.dart';

class BookingDetail {
  const BookingDetail({
    required this.roomId,
    required this.roomName,
    required this.roomIcon,
    required this.roomImageUrl,
    required this.serviceName,
    required this.orderId,
    required this.serviceProviderAvatar,
    required this.selectedDate,
    required this.startTime,
    required this.duration,
    required this.address,
    required this.addressDetail,
    required this.notes,
    required this.servicePricePerHour,
    required this.serviceFeePercent,
    this.quantity = 1,
  });

  final String roomId;
  final String roomName;
  final IconData roomIcon;
  final String roomImageUrl;
  final String serviceName;
  final String orderId;
  final String serviceProviderAvatar;
  final DateTime selectedDate;
  final String startTime;
  final int duration; // in hours
  final String address;
  final String addressDetail;
  final String notes;
  final double servicePricePerHour;
  final double serviceFeePercent;
  final int quantity;

  double get totalServicePrice => servicePricePerHour * duration * quantity;
  double get serviceFee => totalServicePrice * (serviceFeePercent / 100);
  double get totalPrice => totalServicePrice + serviceFee;
}
