import 'dart:developer';

import 'package:expense_tracker/data/bloc/home_bloc/home_bloc.dart';
import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:expense_tracker/utils/string_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../data/bloc/account_bloc/account_bloc.dart';
import '../../utils/bottom.dart';
import '../../utils/constants.dart';
import '../../utils/floating_button.dart';
import 'widgets/top_balance_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: const BottomNavBar(),
          body: state.pages[state.tabIndex],
          floatingActionButton: const FloatButton(),
          backgroundColor: Colors.transparent,
        );
      },
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String week = DateFormat("EEEE").format(DateTime.now());
    String dateMonth = DateFormat("d MMMM, ").format(DateTime.now());
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return SafeArea(
          child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFe4e6ff),
                    Color(0xFFfcf3ff),
                  ],
                  begin: Alignment.bottomCenter,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                //  backgroundColor: const Color(0xFFf0f1ff),
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: dateMonth,
                                        style: AppFont()
                                            .N(
                                              text: '',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            )
                                            .style),
                                    TextSpan(
                                        text: week,
                                        style: AppFont().S(text: '').style),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.notification_add_outlined)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TopContainerWithBalance(),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _incomeCard(),
                          ),
                          const Gap(10),
                          Expanded(
                            child: _expenseCard(),
                          ),
                        ],
                      ),
                      const Gap(20),
                      AppFont().S(
                        fontSize: 18,
                        text: 'Last Transactions',
                        color: const Color.fromARGB(255, 101, 101, 101),
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      todaysTransact(state),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }

  Widget todaysTransact(AccountState state) {
    log(state.expense.length.toString());
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: state.expense.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    showResults(context, index, state);
                  },
                  child: listViewBuild(state, index),
                ),
                const Gap(7)
              ],
            );
          }),
    );
  }

  showResults(
    context,
    index,
    AccountState state,
  ) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(state.expense[index].amount.toString()),
        content: Text(state.expense[index].note),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<AccountBloc>().add(
                    DeleteExpense(state.expense[index].id),
                  );
              Navigator.pop(context, 'Delete');
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Card listViewBuild(AccountState state, int index) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        trailing: Text(state.expense[index].amount.toString()),
        title: Text(state.expense[index].categoryName),
        subtitle: Text(state.expense[index].note),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            state.expense[index].image,
            width: 90,
            height: 90,
          ),
        ),
      ),
    );
  }

  Card _expenseCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFf0cdff),
                Color(0xFFfcf3ff),
              ],
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFF9900e6),
              child: Image.asset(
                AppImages.walletIcon,
                height: 80,
                width: 30,
              ),
            ),
            const Gap(10),
            Column(
              children: [
                AppFont().N(
                  text: '1,800',
                  color: const Color(0xFF9900e6),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                AppFont().S(
                  text: StringConst.expense,
                  color: const Color(0xFF9900e6),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card _incomeCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFa6abff),
                Color(0xFFe5e8ff),
              ],
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFF2e15ff),
              child: Image.asset(
                AppImages.bankIcon,
                height: 80,
                width: 30,
              ),
            ),
            const Gap(10),
            Column(
              children: [
                AppFont().N(
                  text: '1,800',
                  color: const Color(0xFF2e15ff),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                AppFont().S(
                  text: StringConst.income,
                  color: const Color(0xFF2e15ff),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
