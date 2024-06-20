import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartView extends StatelessWidget {
  const PieChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.7,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(),
          sections: [
            PieChartSectionData(title: 'A', color: Colors.blue, value: 20),
            PieChartSectionData(title: 'B', value: 40),
            PieChartSectionData(title: 'C', value: 40),
          ],
        ),
      ),
    );
  }
}
