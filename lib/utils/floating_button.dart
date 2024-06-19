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
      //   backgroundWidget: Icon(Icons.add),
      toggleButtonColor: const Color(0xFF2e15ff),

      alignment: Alignment.bottomRight,

      items: [
        CircularMenuItem(
          color: const Color(0xFF9900e6),
          // enableBadge: true,
          // badgeLabel: 'Expense',
          // badgeColor: Colors.black,
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CalculatorSection()));
          },
          icon: Icons.calculate_rounded,
          // badgeLabel: 'Expense',
          // badgeColor: Colors.black,
          color: Color(0xFFe7c10b),
        ),
        CircularMenuItem(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddBudget()));
          },
          icon: Icons.account_balance,
          // badgeLabel: 'Expense',
          // badgeColor: Colors.black,
          color: Color(0xFF2e15ff),
        ),
      ],
      // onPressed: () {
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => const AddExpense()));
      // },
      // backgroundColor: const Color(0xFF42887c),
      // child: const Icon(
      //   Icons.add,
      //   size: 30,
      //   color: Colors.white,
      // ),
    );
  }
}
