import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../data/bloc/math_bloc/math_bloc.dart';

class CalculatorView extends StatelessWidget {
  CalculatorView({super.key, this.decoration, this.width, this.height});

  BoxDecoration? decoration;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => MathBloc(),
      child: Expanded(
        child: BlocBuilder<MathBloc, MathState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Gap(10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.bottomRight,
                    width: screenSize.width,
                    child: AppFont().N(
                        text: ('${state.number1}${state.operand}${state.number2}')
                                .isEmpty
                            ? '0'
                            : '${state.number1}${state.operand}${state.number2}',
                        fontSize: 40,
                        align: TextAlign.end,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible),
                  ),
                ),
                const Gap(20),
                Wrap(
                  alignment: WrapAlignment.end,
                  // runSpacing: 5,
                  // spacing: 4,
                  children: state.numbers
                      .map(
                        (value) => InkWell(
                          onTap: () {
                            context.read<MathBloc>().add(OnButtonTap(value));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(6),
                            decoration:
                                decoration ?? _buttonBoxDecoration(value),
                            alignment: Alignment.center,
                            width: width ??
                                (['0'].contains(value)
                                    ? screenSize.width / 2.27
                                    : screenSize.width / 4.8),
                            height: height ?? 65,
                            child: buildButton(value),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  BoxDecoration _buttonBoxDecoration(value) {
    return BoxDecoration(
        boxShadow: ['÷', 'x', '-', '+', '='].contains(value)
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
        borderRadius: BorderRadius.circular(18));
  }

  Widget buildButton(value) {
    return AppFont().N(
      text: value,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }
}
