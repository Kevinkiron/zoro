import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.cancel_sharp),
              Text('CANCEL'),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.save_as_rounded),
                Text('SAVE'),
              ],
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                child: AppFont().S(text: 'INCOME'),
              ),
              Tab(
                child: AppFont().S(text: 'EXPENSE'),
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          Text('data'),
          Text('data'),
        ]),
      ),
    );
  }
}
