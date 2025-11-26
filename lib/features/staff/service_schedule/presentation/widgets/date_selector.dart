import 'package:flutter/material.dart';
import '../../data/models/schedule_date.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({
    super.key,
    required this.dates,
    required this.selectedDate,
    required this.onDateSelected,
  });

  final List<ScheduleDate> dates;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 0.5,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: dates.map((scheduleDate) {
            final isSelected = scheduleDate.date.year == selectedDate.year &&
                scheduleDate.date.month == selectedDate.month &&
                scheduleDate.date.day == selectedDate.day;

            return InkWell(
              onTap: () => onDateSelected(scheduleDate.date),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  children: [
                    Text(
                      scheduleDate.dayLabel,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: isSelected || scheduleDate.isToday
                            ? Colors.green
                            : Colors.black87,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected || scheduleDate.isToday
                            ? Colors.green
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          '${scheduleDate.dayNumber}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isSelected || scheduleDate.isToday
                                ? Colors.white
                                : Colors.black87,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}



