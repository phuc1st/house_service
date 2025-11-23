import 'package:flutter/material.dart';
import 'reschedule_time_modal.dart';

class RescheduleCalendarModal extends StatefulWidget {
  const RescheduleCalendarModal({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
    this.onCancel,
  });

  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;
  final VoidCallback? onCancel;

  @override
  State<RescheduleCalendarModal> createState() => _RescheduleCalendarModalState();
}

class _RescheduleCalendarModalState extends State<RescheduleCalendarModal> {
  late DateTime _selectedDate;
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _currentMonth = DateTime(_selectedDate.year, _selectedDate.month, 1);
  }

  void _selectDate(DateTime date) {
    if (_isSameMonth(date, _currentMonth)) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    });
  }

  List<DateTime> _getDaysInMonth() {
    final firstDay = _currentMonth;
    final lastDay = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    final firstDayOfWeek = firstDay.weekday % 7; // 0 = Sunday
    final daysInMonth = lastDay.day;

    final List<DateTime> days = [];

    // Add days from previous month
    final prevMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 0);
    for (int i = firstDayOfWeek - 1; i >= 0; i--) {
      days.add(DateTime(_currentMonth.year, _currentMonth.month - 1, prevMonth.day - i));
    }

    // Add days from current month
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(_currentMonth.year, _currentMonth.month, i));
    }

    // Add days from next month to fill the grid
    final remainingDays = 42 - days.length; // 6 weeks * 7 days
    for (int i = 1; i <= remainingDays; i++) {
      days.add(DateTime(_currentMonth.year, _currentMonth.month + 1, i));
    }

    return days;
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  bool _isSameMonth(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month;
  }

  bool _isWeekend(DateTime date) {
    final weekday = date.weekday;
    return weekday == DateTime.saturday || weekday == DateTime.sunday;
  }

  void _showTimeModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RescheduleTimeModal(
          initialStartTime: const TimeOfDay(hour: 9, minute: 30),
          initialEndTime: const TimeOfDay(hour: 11, minute: 30),
          selectedDate: _selectedDate,
          onTimeConfirmed: (TimeOfDay startTime, TimeOfDay endTime) {
            // Handle time confirmation
            // TODO: Implement time update logic
            print('Start time: ${startTime.hour}:${startTime.minute}');
            print('End time: ${endTime.hour}:${endTime.minute}');
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final days = _getDaysInMonth();
    final monthNames = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    // Show selected date if it's in current month, otherwise show first day of current month
    final displayDate = _isSameMonth(_selectedDate, _currentMonth)
        ? _selectedDate
        : DateTime(_currentMonth.year, _currentMonth.month, 1);
    final monthYearText = '${displayDate.day} ${monthNames[_currentMonth.month - 1]} ${_currentMonth.year}';

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF8DF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with icon and title
            Row(
              children: [
                InkWell(
                  onTap: () {
                    _showTimeModal(context);
                  },
                  child: const Icon(
                    Icons.access_time,
                    size: 24,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Thay đổi lịch công việc',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () {
                    if (widget.onCancel != null) {
                      widget.onCancel!();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Calendar Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // Month/Year Navigation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, size: 18),
                        onPressed: _previousMonth,
                        color: Colors.blue,
                      ),
                      Text(
                        monthYearText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, size: 18),
                        onPressed: _nextMonth,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Days of week header
                  Row(
                    children: ['M', 'T', 'W', 'T', 'F', 'S', 'S']
                        .map((day) => Expanded(
                              child: Center(
                                child: Text(
                                  day,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 12),
                  // Calendar grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      childAspectRatio: 1,
                    ),
                    itemCount: days.length,
                    itemBuilder: (context, index) {
                      final date = days[index];
                      final isSelected = _isSameDay(date, _selectedDate);
                      final isCurrentMonth = _isSameMonth(date, _currentMonth);
                      final isWeekend = _isWeekend(date);

                      return InkWell(
                        onTap: () {
                          if (isCurrentMonth) {
                            _selectDate(date);
                          } else {
                            // Navigate to that month
                            setState(() {
                              _currentMonth = DateTime(date.year, date.month, 1);
                              _selectedDate = date;
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: isSelected
                                ? Border.all(
                                    color: Colors.blue.shade300,
                                    width: 2,
                                  )
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              '${date.day}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: isWeekend && isCurrentMonth
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isCurrentMonth
                                    ? Colors.blue.shade900
                                    : Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      if (widget.onCancel != null) {
                        widget.onCancel!();
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: const Text(
                      'Hủy',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onDateSelected(_selectedDate);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB23D0A),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Xác nhận',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

