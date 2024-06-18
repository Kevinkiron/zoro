import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../data/bloc/account_bloc/account_bloc.dart';
import '../home/home.dart';
import 'widgets/bottom_sheet.dart';
import 'widgets/custom_textfield.dart';

class AddExpenseValue extends StatelessWidget {
  const AddExpenseValue({super.key});

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
          BlocBuilder<AccountBloc, AccountState>(
            builder: (context, state) {
              return _expenseTab(context, state, context.read<AccountBloc>());
            },
          ),
        ],
      ),
    );
  }

  Padding _expenseTab(
      BuildContext context, AccountState state, AccountBloc bloc) {
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
                  const Gap(10),
                  _categorySelection(context),
                ],
              ),
              const Gap(30),
              AppFont().S(
                  text: 'ADD INCOME',
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              const Gap(10),
              CustomTextfield(
                controller: bloc.expenseAmount,
                hintText: 'Expense',
              ),
              const Gap(20),
              AppFont().S(
                  text: 'ADD NOTE', fontSize: 14, fontWeight: FontWeight.bold),
              const Gap(10),
              CustomTextfield(
                controller: bloc.expenseNote,
                maxLines: 4,
                hintText: 'notes',
              ),
              const Gap(40),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                  onTap: () {
                    bloc.add(AddExpense(
                      bloc.expenseNote.text,
                      double.tryParse(bloc.expenseAmount.text) ?? 0,
                    ));

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
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
                      ),
                    ),
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _accountSelection(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                height: 350,
                child: Column(
                  children: [
                    const Gap(20),
                    AppFont().S(
                        text: 'Select an account',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    const Gap(20),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 8,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return _listViewOfAccount();
                          }),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          addNewAccount(context);
                        },
                        child: const Text('data')),
                  ],
                ),
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

  Future<String?> addNewAccount(BuildContext context) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => CustomAlertDialogAddAccount());
  }

  Future<String?> addNewExpense(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        elevation: 18,
        scrollable: true,
        title: const Text('Add New Account'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text('Amount')),
                Gap(10),
                Expanded(
                  flex: 3,
                  child: CustomTextfield(
                    hintText: 'Amount',
                  ),
                ),
              ],
            ),
            Gap(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text('Name')),
                Gap(10),
                Expanded(
                  flex: 3,
                  child: CustomTextfield(
                    hintText: 'Account Name',
                  ),
                ),
              ],
            ),
            Icon(Icons.abc),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Column _listViewOfAccount() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.abc),
                  AppFont().S(text: 'cds'),
                ],
              ),
              AppFont().N(text: '3000')
            ],
          ),
        ),
        const Gap(10)
      ],
    );
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
