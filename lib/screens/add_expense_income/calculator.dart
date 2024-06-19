import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:expense_tracker/utils/calculator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CalculatorSection extends StatelessWidget {
  const CalculatorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppFont().S(text: 'CALCULATOR'),
      ),
      body: Column(
        children: [
          //  Container(),
          CalculatorView(),
          const Gap(20)
        ],
      ),
    );
  }
}
