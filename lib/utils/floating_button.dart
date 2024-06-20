import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

import '../screens/add_expense_income/budget_form.dart';
import '../screens/add_expense_income/calculator.dart';
import '../screens/add_expense_income/expense_form.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
      toggleButtonColor: const Color(0xFF2e15ff),
      alignment: Alignment.bottomRight,
      items: [
        CircularMenuItem(
          color: const Color(0xFF9900e6),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddExpenseValue()));
          },
          icon: Icons.account_balance_wallet,
        ),
        CircularMenuItem(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CalculatorSection()));
          },
          icon: Icons.calculate_rounded,
          color: const Color(0xFFe7c10b),
        ),
        CircularMenuItem(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddBudget()));
          },
          icon: Icons.account_balance,
          color: const Color(0xFF2e15ff),
        ),
      ],
    );
  }
}
