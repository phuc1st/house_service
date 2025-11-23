class ScheduleDate {
  const ScheduleDate({
    required this.date,
    required this.dayLabel,
    required this.dayNumber,
    required this.isToday,
  });

  final DateTime date;
  final String dayLabel; // "Hôm nay", "Th 4", "Th 5", etc.
  final int dayNumber;
  final bool isToday;
}

