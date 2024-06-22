import 'dart:developer';

import 'package:expense_tracker/data/bloc/account_bloc/account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../utils/app_font_styles.dart';
import '../home/home.dart';
import 'bloc/budget_form_bloc.dart';
import 'widgets/accounts_list_bottom_sheet.dart';
import 'widgets/alert_dialog_accounts.dart';

class AddBudget extends StatelessWidget {
  const AddBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFFe4e6ff),
        Color(0xFFfcf3ff),
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: AppFont().S(
            text: 'ADD INCOME',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Column(
          children: [
            BlocBuilder<BudgetFormBloc, BudgetFormState>(
              builder: (context, state) {
                return _incomeTab(context, state);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _incomeTab(BuildContext context, BudgetFormState state) {
  return BlocBuilder<AccountBloc, AccountState>(
    builder: (context, accountState) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  Row(
                    children: [
                      _accountSelection(context, state,
                          context.read<AccountBloc>(), accountState),
                    ],
                  ),
                  const Gap(30),
                  AppFont().S(
                      text: 'ADD INCOME',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  const Gap(10),
                  TextField(
                    controller: context.read<AccountBloc>().amount,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hintText: 'Income',
                      hintStyle: TextStyle(
                        fontStyle: AppFont().S(text: '').style?.fontStyle,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                  const Gap(20),
                  AppFont().S(
                      text: 'ADD NOTE',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  const Gap(10),
                  TextField(
                    controller: context.read<AccountBloc>().note,
                    maxLines: 4,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hintText: 'Notes',
                      hintStyle: TextStyle(
                        fontStyle: AppFont().S(text: '').style?.fontStyle,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                  const Gap(40),
                ],
              ),
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(1, 1),
                              spreadRadius: 0,
                              blurRadius: 2,
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(-1, -1),
                              spreadRadius: 0,
                              blurRadius: 2,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFe4a5ff),
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
                      final amount = double.tryParse(
                          context.read<AccountBloc>().amount.text);
                      context.read<AccountBloc>().add(AddAmount(
                            context.read<AccountBloc>().note.text,
                            amount ?? 0,
                            accountState.addAccount,
                          ));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: const Offset(1, 1),
                            spreadRadius: 0,
                            blurRadius: 2,
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: const Offset(-1, -1),
                            spreadRadius: 0,
                            blurRadius: 2,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF7373ff),
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
    },
  );
}

Expanded _accountSelection(BuildContext context, BudgetFormState state,
    AccountBloc bloc, AccountState accountState) {
  return Expanded(
      child: GestureDetector(
    onTap: () {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              color: Colors.white,
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
                  const AccountListBottomSheet(),
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
            Color(0xFF2f14ff),
            Color(0xFF2e15ff),
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
                Icons.assured_workload_outlined,
                color: Colors.white,
              ),
              const Gap(8),
              AppFont().S(
                text: accountState.selectedAccountName.isEmpty
                    ? 'Add Account'.toUpperCase()
                    : accountState.selectedAccountName,
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
        ],
      ),
    ),
  ));
}

Future<String?> addNewAccount(BuildContext context) {
  return showDialog<String>(
      context: context,
      builder: (BuildContext context) => const CustomAlertDialogAddAccount());
}
