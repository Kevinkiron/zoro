import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartView extends StatelessWidget {
  const BarChartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: BarChart(
          BarChartData(
            backgroundColor: Colors.white,
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                    toY: 20,
                    width: 18,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    backDrawRodData: BackgroundBarChartRodData(
                      color: Colors.grey.withOpacity(0.5),
                      show: true,
                      fromY: 30,
                    ),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    toY: 10,
                    width: 18,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                    toY: 4,
                    width: 18,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    backDrawRodData: BackgroundBarChartRodData(
                      color: Colors.grey.withOpacity(0.5),
                      show: true,
                      fromY: 30,
                    ),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                    toY: 30,
                    width: 18,
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    // backDrawRodData: BackgroundBarChartRodData(
                    //   color: Colors.grey.withOpacity(0.5),
                    //   show: true,
                    //   fromY: 30,
                    // ),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                    toY: 25,
                    width: 18,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    backDrawRodData: BackgroundBarChartRodData(
                      color: Colors.grey.withOpacity(0.5),
                      show: true,
                      fromY: 30,
                    ),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                    toY: 20,
                    width: 18,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    backDrawRodData: BackgroundBarChartRodData(
                      color: Colors.grey.withOpacity(0.5),
                      show: true,
                      fromY: 30,
                    ),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(
                    toY: 20,
                    width: 18,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    backDrawRodData: BackgroundBarChartRodData(
                      color: Colors.grey.withOpacity(0.5),
                      show: true,
                      fromY: 30,
                    ),
                  ),
                ],
              ),
            ],
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            alignment: BarChartAlignment.spaceEvenly,
            titlesData: FlTitlesData(
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 0:
                        return const Text('Mon');
                      case 1:
                        return const Text('Tue');

                      case 2:
                        return const Text('Wed');

                      case 3:
                        return const Text('Thur');

                      case 4:
                        return const Text('Fri');

                      case 5:
                        return const Text('Sat');

                      case 6:
                        return const Text('Sun');

                      default:
                        return const Text('');
                    }
                  },
                ))),
          ),
        ),
      ),
    );
  }
}
