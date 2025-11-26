import 'package:flutter/material.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/staff_bottom_navigation_bar.dart';
import '../../data/service_types_mock_data.dart';
import '../../data/models/service_type.dart';
import '../widgets/service_type_item.dart';

class ServiceTypesScreen extends StatefulWidget {
  const ServiceTypesScreen({super.key});

  @override
  State<ServiceTypesScreen> createState() => _ServiceTypesScreenState();
}

class _ServiceTypesScreenState extends State<ServiceTypesScreen> {
  late List<ServiceType> _serviceTypes;

  @override
  void initState() {
    super.initState();
    _serviceTypes = List.from(mockServiceTypes);
  }

  void _toggleServiceType(int index, bool value) {
    setState(() {
      _serviceTypes[index] = _serviceTypes[index].copyWith(isEnabled: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppHeader(
          title: 'Loại dịch vụ',
        ),
        body: Column(
          children: [
            // Header row
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade200,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Dịch vụ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Trạng thái',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Service types list
            Expanded(
              child: ListView.builder(
                itemCount: _serviceTypes.length,
                itemBuilder: (context, index) {
                  final serviceType = _serviceTypes[index];
                  return ServiceTypeItem(
                    serviceType: serviceType,
                    onToggle: (value) => _toggleServiceType(index, value),
                  );
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



