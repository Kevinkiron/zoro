import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/calculator.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 90,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.cancel_sharp),
                const Gap(5),
                AppFont().S(text: 'CANCEL'),
              ],
            ),
          ),
          actions: const [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.save_as_rounded),
                  Gap(5),
                  Text('SAVE'),
                  Gap(15),
                ],
              ),
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
          _incomeTab(),
          _expenseTab(),
        ]),
      ),
    );
  }

  Column _expenseTab() {
    return Column(
      children: [
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _accountSelection(),
                  const Gap(8),
                  _categorySelection(),
                ],
              ),
              const Gap(10),
              const TextField(
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Add Comment On Expense...',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(4),
        CalculatorView(),
        const Gap(10),
      ],
    );
  }

  Column _incomeTab() {
    return Column(
      children: [
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _accountSelection(),
                  const Gap(8),
                  _categorySelection(),
                ],
              ),
              const Gap(10),
              const TextField(
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Add Comment On Expense...',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(4),
        CalculatorView(),
        const Gap(10),
      ],
    );
  }

  Expanded _accountSelection() {
    return Expanded(
        child: Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFA0ADC4),
            Color(0xFFC5CEDF),
            Color(0xFFC5CEDF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.assured_workload_outlined),
          const Gap(8),
          AppFont().S(text: 'Account'),
        ],
      ),
    ));
  }

  Expanded _categorySelection() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFA0ADC4),
              Color(0xFFC5CEDF),
              Color(0xFFC5CEDF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.category_rounded),
            const Gap(8),
            AppFont().S(text: 'Category'),
          ],
        ),
      ),
    );
  }
}
