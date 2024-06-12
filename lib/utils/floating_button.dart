import 'package:flutter/material.dart';

import '../screens/add_expense_income/expense_form.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddExpense()));
      },
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }
}
