import 'package:intl/intl.dart';
import 'models/schedule_date.dart';
import 'models/schedule_order.dart';

// Generate schedule dates for next 7 days
List<ScheduleDate> getScheduleDates() {
  final now = DateTime.now();
  final dates = <ScheduleDate>[];

  for (int i = 0; i < 7; i++) {
    final date = now.add(Duration(days: i));
    final isToday = i == 0;
    String dayLabel;

    if (isToday) {
      dayLabel = 'Hôm nay';
    } else {
      final weekday = date.weekday;
      switch (weekday) {
        case 1:
          dayLabel = 'Th 2';
          break;
        case 2:
          dayLabel = 'Th 3';
          break;
        case 3:
          dayLabel = 'Th 4';
          break;
        case 4:
          dayLabel = 'Th 5';
          break;
        case 5:
          dayLabel = 'Th 6';
          break;
        case 6:
          dayLabel = 'Th 7';
          break;
        case 7:
          dayLabel = 'Cn';
          break;
        default:
          dayLabel = '';
      }
    }

    dates.add(ScheduleDate(
      date: date,
      dayLabel: dayLabel,
      dayNumber: date.day,
      isToday: isToday,
    ));
  }

  return dates;
}

// Mock orders - empty for now (showing empty state)
List<ScheduleOrder> getOrdersForDate(DateTime date) {
  // Return empty list to show empty state
  return [];
}

