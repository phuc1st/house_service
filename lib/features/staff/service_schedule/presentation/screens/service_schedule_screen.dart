import 'package:flutter/material.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/staff_bottom_navigation_bar.dart';
import '../../data/service_schedule_mock_data.dart';
import '../../data/models/schedule_order.dart';
import '../widgets/date_selector.dart';
import '../widgets/filter_buttons.dart';
import '../widgets/empty_state.dart';

class ServiceScheduleScreen extends StatefulWidget {
  const ServiceScheduleScreen({super.key});

  @override
  State<ServiceScheduleScreen> createState() => _ServiceScheduleScreenState();
}

class _ServiceScheduleScreenState extends State<ServiceScheduleScreen> {
  late DateTime _selectedDate;
  String? _selectedFilter;
  late List<ScheduleOrder> _orders;

  @override
  void initState() {
    super.initState();
    final dates = getScheduleDates();
    _selectedDate = dates.firstWhere((d) => d.isToday).date;
    _loadOrders();
  }

  void _loadOrders() {
    setState(() {
      _orders = getOrdersForDate(_selectedDate);
      // Apply filter if selected
      if (_selectedFilter != null) {
        _orders = _orders.where((order) {
          if (_selectedFilter == 'golden') {
            return order.isGoldenHour;
          } else if (_selectedFilter == 'effective') {
            return order.isEffectiveHour;
          }
          return true;
        }).toList();
      }
    });
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
    _loadOrders();
  }

  void _onFilterChanged(String? filter) {
    setState(() {
      _selectedFilter = filter;
    });
    _loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    final dates = getScheduleDates();

    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppHeader(
          title: 'Lịch nhận dịch vụ',
        ),
        body: Column(
          children: [
            // Date Selector
            DateSelector(
              dates: dates,
              selectedDate: _selectedDate,
              onDateSelected: _onDateSelected,
            ),
            // Filter Buttons
            FilterButtons(
              selectedFilter: _selectedFilter,
              onFilterChanged: _onFilterChanged,
            ),
            // Content Area
            if (_orders.isEmpty)
              const EmptyState()
            else
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _orders.length,
                  itemBuilder: (context, index) {
                    final order = _orders[index];
                    // TODO: Build order card widget
                    return Container();
                  },
                ),
              ),
          ],
        ),
        bottomNavigationBar: const StaffBottomNavigationBar(
          currentIndex: 3,
        ),
      ),
    );
  }
}

