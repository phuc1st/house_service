import 'package:flutter/material.dart';
import 'models/booking_detail.dart';

// Mock booking detail data
BookingDetail getMockBookingDetail({
  required String roomId,
  required String roomName,
  required IconData roomIcon,
  required String roomImageUrl,
  int quantity = 1,
}) {
  return BookingDetail(
    roomId: roomId,
    roomName: roomName,
    roomIcon: roomIcon,
    roomImageUrl: roomImageUrl,
    serviceName: 'Dọn dẹp nhà cửa',
    orderId: '#8843-2551',
    serviceProviderAvatar:
        'https://www.figma.com/api/mcp/asset/ecdb8a69-6add-4990-bbd5-4b339e7736ad',
    selectedDate: DateTime(2025, 10, 31),
    startTime: '10:00 AM',
    duration: 3,
    address: '129/7 Ngũ Hành Sơn, Đà Nẵng',
    addressDetail: 'Nhà riêng, Tầng 2, Căn hộ 201',
    notes: '',
    servicePricePerHour: 15.0,
    serviceFeePercent: 10.0,
    quantity: quantity,
  );
}
