import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppFont().S(
          text: 'ADD EXPENSE',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          _expenseTab(context),
        ],
      ),
    );
  }

  Padding _expenseTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Row(
                children: [
                  _accountSelection(context),
                  Gap(10),
                  _categorySelection(context),
                ],
              ),
              const Gap(30),
              AppFont().S(
                  text: 'ADD INCOME',
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              const Gap(10),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  hintText: 'Expense',
                  hintStyle: TextStyle(
                    fontStyle: AppFont().S(text: '').style?.fontStyle,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              Gap(20),
              AppFont().S(
                  text: 'ADD NOTE', fontSize: 14, fontWeight: FontWeight.bold),
              const Gap(10),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  hintText: 'notes',
                  hintStyle: TextStyle(
                    fontStyle: AppFont().S(text: '').style?.fontStyle,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              Gap(40),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 1),
                            spreadRadius: 0,
                            blurRadius: 2,
                          ),
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(-1, -1),
                            spreadRadius: 0,
                            blurRadius: 2,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFff3623),
                      ),
                      child: Center(
                          child: AppFont().S(
                        text: 'CANCEL',
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                ),
                const Gap(20),
                Expanded(
                    child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          spreadRadius: 0,
                          blurRadius: 2,
                        ),
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(-1, -1),
                          spreadRadius: 0,
                          blurRadius: 2,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF336e64),
                    ),
                    child: Center(
                        child: AppFont().S(
                      text: 'SAVE',
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _accountSelection(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                height: 300,
              );
            });
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              spreadRadius: 0,
              blurRadius: 2,
            ),
            BoxShadow(
              color: Colors.grey,
              offset: Offset(-1, -1),
              spreadRadius: 0,
              blurRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF336e64),
              Color(0xFF5da497),
              // Color(0xFF2c5952),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.assured_workload_outlined,
                    color: Colors.white),
                const Gap(8),
                AppFont().S(
                    text: 'Add Account'.toUpperCase(),
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ],
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
      ),
    ));
  }

  Expanded _categorySelection(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                height: 300,
              );
            });
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              spreadRadius: 0,
              blurRadius: 2,
            ),
            BoxShadow(
              color: Colors.grey,
              offset: Offset(-1, -1),
              spreadRadius: 0,
              blurRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF336e64),
              Color(0xFF5da497),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.category_rounded,
                  color: Colors.white,
                ),
                const Gap(8),
                AppFont().S(
                    text: 'Category'.toUpperCase(),
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ],
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
      ),
    ));
  }
}
