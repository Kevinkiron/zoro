import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.cancel_sharp),
                  Text('CANCEL'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.save_as_rounded),
                  Text('SAVE'),
                ],
              ),
            ],
          ),
        ], 
        bottom: TabBar(
          tabs: [
            Tab(
              child: AppFont().S(text: 'INCOME'),
            ),
            Tab(
              child: AppFont().S(text: 'INCOME'),
            )
          ],
        ),

      ),
    );
  }
}
