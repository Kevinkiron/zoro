import 'package:expense_tracker/utils/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text('Transactions'),
        Gap(20),
        BarChartView(),
      ],
    ));
  }
}
