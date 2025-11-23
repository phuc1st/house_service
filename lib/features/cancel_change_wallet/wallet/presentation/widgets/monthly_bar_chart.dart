import 'package:flutter/material.dart';
import '../../data/models/monthly_data.dart';

class MonthlyBarChart extends StatelessWidget {
  const MonthlyBarChart({
    super.key,
    required this.monthlyData,
  });

  final List<MonthlyData> monthlyData;

  static const double maxValue = 600;
  static const List<String> yAxisLabels = ['0', '100', '200', '300', '400', '500', '600'];

  @override
  Widget build(BuildContext context) {
    final maxDataValue = monthlyData.map((e) => e.value).reduce((a, b) => a > b ? a : b);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Theo tháng',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          // Chart
          SizedBox(
            height: 280,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Y-axis labels
                SizedBox(
                  width: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: yAxisLabels.reversed.map((label) {
                      return Text(
                        label,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 12),
                // Bars
                Expanded(
                  child: Column(
                    children: [
                      // Chart area
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: monthlyData.map((data) {
                            final height = (data.value / maxValue) * 240; // Max height 240
                            return Container(
                              width: 30,
                              height: height,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color(0xFFB3E5FC),
                                    Color(0xFFFFB3E5),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // X-axis labels
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: monthlyData.map((data) {
                          return SizedBox(
                            width: 30,
                            child: Text(
                              data.month,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

