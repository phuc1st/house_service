class ScheduleOrder {
  const ScheduleOrder({
    required this.id,
    required this.serviceName,
    required this.timeSlot,
    required this.customerName,
    required this.address,
    required this.price,
    this.isGoldenHour = false,
    this.isEffectiveHour = false,
  });

  final String id;
  final String serviceName;
  final String timeSlot; // e.g., "10:00 - 12:00"
  final String customerName;
  final String address;
  final String price;
  final bool isGoldenHour;
  final bool isEffectiveHour;
}



