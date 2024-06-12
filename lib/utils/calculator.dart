import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../screens/add_expense_income/bloc/math_bloc.dart';

class CalculatorView extends StatelessWidget {
  CalculatorView({super.key});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => MathBloc(),
      child: Material(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green.shade100, width: 2)),
          child: Column(
            children: [
              const Gap(10),
              AppFont()
                  .N(text: '32,000', fontSize: 20, fontWeight: FontWeight.bold),
              const Gap(20),
              BlocBuilder<MathBloc, MathState>(
                builder: (context, state) {
                  return Wrap(
                    alignment: WrapAlignment.end,
                    runSpacing: 5,
                    spacing: 4,
                    children: state.numbers
                        .map(
                          (value) => Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                boxShadow:
                                    ['÷', 'x', '-', '+', '='].contains(value)
                                        ? const [
                                            BoxShadow(
                                              color: Color(0xFFC15D17),
                                              offset: Offset(3, 3),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                            ),
                                            BoxShadow(
                                              color: Color(0xFFDF8419),
                                              offset: Offset(-2, -2),
                                              spreadRadius: 1,
                                              blurRadius: 0,
                                            ),
                                          ]
                                        : const [
                                            BoxShadow(
                                              color: Color(0xFFA0ADC4),
                                              offset: Offset(3, 3),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                            ),
                                            BoxShadow(
                                              color: Color(0xFFC5CEDF),
                                              offset: Offset(-2, -2),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                            ),
                                          ],
                                gradient: ['C', 'AC', "%"].contains(value)
                                    ? const LinearGradient(
                                        colors: [
                                          Color(0xFFA0ADC4),
                                          Color(0xFFC5CEDF),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )
                                    : ['÷', 'x', '-', '+', '='].contains(value)
                                        ? const LinearGradient(
                                            colors: [
                                              Color(0xFFDF8419),
                                              Color(0xFFC15D17),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          )
                                        : const LinearGradient(
                                            colors: [
                                              Color(0xFFCED2DE),
                                              Color(0xFFECEFF4),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.circular(18)),
                            alignment: Alignment.center,
                            width: ['0'].contains(value)
                                ? screenSize.width / 2.5
                                : screenSize.width / 5.5,
                            height: 65,
                            child: buildButton(value),
                          ),
                        )
                        .toList(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Text(value);
  }
}
