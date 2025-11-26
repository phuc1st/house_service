import 'package:flutter/material.dart';

// --- MODELS ---

// Base Activity Model
class ActivityModel {
  final String orderCode;
  final String date;
  final String time;
  final String location;
  final String status;
  final Color statusColor;
  final Color statusTextColor;

  ActivityModel({
    required this.orderCode,
    required this.date,
    required this.time,
    required this.location,
    required this.status,
    required this.statusColor,
    this.statusTextColor = const Color(0xFF28A745), // Default dark green
  });
}

// Model for "In Progress" activities (includes staff info)
class InProgressActivityModel extends ActivityModel {
  final String staffName;
  final String staffRating;
  final int staffJobs;
  final String staffAvatarUrl;
  final String currentStatus;

  InProgressActivityModel({
    required super.orderCode,
    required this.staffName,
    required this.staffRating,
    required this.staffJobs,
    required this.staffAvatarUrl,
    required super.date,
    required super.time,
    required super.location,
    required this.currentStatus,
    required super.statusColor,
    super.statusTextColor,
  }) : super(status: currentStatus);
}

// Model for "Completed" activities (includes rating status)
class CompletedActivityModel extends ActivityModel {
  final String staffName;
  final String staffAvatarUrl;
  final bool hasRated; // Already rated or not

  CompletedActivityModel({
    required super.orderCode,
    required this.staffName,
    required this.staffAvatarUrl,
    required super.date,
    required super.time,
    required super.location,
    required super.status,
    required super.statusColor,
    required this.hasRated,
  }) : super(statusTextColor: const Color(0xFF28A745));
}


// --- MOCK DATA ---

// Data for "Đang chờ" (Waiting)
final List<ActivityModel> waitingActivities = [
  ActivityModel(
    orderCode: '#B84D-2131',
    date: 'Thứ Sáu, 12 Th2 2026',
    time: '10:00 - 12:00 (2 giờ)',
    location: 'Nhà của tôi',
    status: 'Đã lên lịch',
    statusColor: const Color(0xFFE6FFE9),
  ),
  ActivityModel(
    orderCode: '#B84D-2132',
    date: 'Thứ Sáu, 12 Th2 2026',
    time: '10:00 - 13:00 (2 giờ)',
    location: 'Nhà của tôi',
    status: 'Đã lên lịch',
    statusColor: const Color(0xFFE6FFE9),
  ),
  ActivityModel(
    orderCode: '#B84D-2133',
    date: 'Thứ Sáu, 12 Th2 2026',
    time: '10:00 - 12:00 (2 giờ)',
    location: 'Nhà của tôi',
    status: 'Đã lên lịch',
    statusColor: const Color(0xFFE6FFE9),
  ),
];

// Data for "Đang làm" (In Progress)
final List<InProgressActivityModel> inProgressActivities = [
  InProgressActivityModel(
    orderCode: '#B84D-2551',
    staffName: 'TaPu',
    staffRating: '5.0/5',
    staffJobs: 400,
    staffAvatarUrl: 'https://placehold.co/100x100/F4D8D2/D97200?text=TP',
    date: 'Thứ Sáu, 12 Th2 2026',
    time: '10:00 - 12:00 (2 giờ)',
    location: 'Nhà của tôi',
    currentStatus: 'Đang di chuyển',
    statusColor: const Color(0xFFFFF0E6),
    statusTextColor: const Color(0xFFD97200), // Orange text
  ),
];

// Data for "Hoàn thành" (Completed)
final List<CompletedActivityModel> completedActivities = [
  CompletedActivityModel(
    orderCode: '#B84D-2552',
    staffName: 'TaPu',
    staffAvatarUrl: 'https://placehold.co/100x100/F4D8D2/D97200?text=TP',
    date: 'Thứ Năm, 11 Th2 2026',
    time: '14:00 - 16:00 (2 giờ)',
    location: 'Văn phòng',
    status: 'Đã hoàn thành',
    statusColor: const Color(0xFFE6FFE9),
    hasRated: false, // Not rated yet
  ),
  CompletedActivityModel(
    orderCode: '#B84D-2553',
    staffName: 'Jane Doe',
    staffAvatarUrl: 'https://placehold.co/100x100/C1E7E5/007A65?text=JD',
    date: 'Thứ Ba, 9 Th2 2026',
    time: '09:00 - 10:00 (1 giờ)',
    location: 'Căn hộ',
    status: 'Đã hoàn thành',
    statusColor: const Color(0xFFE6FFE9),
    hasRated: true, // Already rated
  ),
];

// Data for "Đã Hủy" (Canceled)
final List<ActivityModel> canceledActivities = [
  ActivityModel(
    orderCode: '#B84D-2554',
    date: 'Thứ Ba, 9 Th2 2026',
    time: '09:00 - 10:00 (1 giờ)',
    location: 'Căn hộ',
    status: 'Đã Hủy',
    statusColor: const Color(0xFFFFECE6), // Light orange/pink background
    statusTextColor: const Color(0xFFE55D30), // Darker orange/red text
  ),
];