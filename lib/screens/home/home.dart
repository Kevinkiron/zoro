import 'dart:developer';

import 'package:expense_tracker/data/bloc/home_bloc/home_bloc.dart';
import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:expense_tracker/utils/string_const.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../data/bloc/account_bloc/account_bloc.dart';
import '../../utils/bottom.dart';
import '../../utils/constants.dart';
import '../../utils/floating_button.dart';
import '../../utils/pie_chart.dart';

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
    String week = DateFormat("EEEE,").format(DateTime.now());
    String dateMonth = DateFormat("d MMMM").format(DateTime.now());
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppFont().S(
                          text: week,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      AppFont().S(
                          text: dateMonth,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),

                      // Text(week),
                      // Text(
                      //   dateMonth,
                      //   style: const TextStyle(
                      //       fontSize: 18, fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
                  const Icon(Icons.notification_add_outlined)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              FlipCard(
                direction: FlipDirection.HORIZONTAL,
                speed: 1000,
                front: _frontSideTopCard(),
                back: _backSideTopCard(),
              ),
              const SizedBox(
                height: 10,
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
              // const SizedBox(
              //   height: 15,
              // ),
              //  _budgetForDayCard(),
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
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
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
        title: const Text('Shopping'),
        subtitle: Text(state.expense[index].note),
        leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: const Color(0xFF91E894),
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.ac_unit_sharp)),
      ),
    );
  }

  Container _budgetForDayCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      height: 90,
      width: 400,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 91, 184, 168),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppFont().S(
                text: StringConst.budgetForToday,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              AppFont().S(
                text: StringConst.cashAvailable,
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const Text(
            '2,478',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Card _expenseCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: const Color(0xFFffc5c0),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFff3623),
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
                  color: const Color(0xFFff3623),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                AppFont().S(
                  text: StringConst.expense,
                  color: const Color(0xFFff3623),
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
      elevation: 6,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: const Color(0xFFb3dcd1),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFF42887c),
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
                  color: const Color(0xFF42887c),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                AppFont().S(
                  text: StringConst.income,
                  color: const Color(0xFF42887c),
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

  Container _backSideTopCard() {
    return Container(
      height: 150,
      // width: 400,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 1),
            spreadRadius: 3,
            blurRadius: 6,
          ),
        ],
        image: const DecorationImage(
          image: AssetImage(
            AppImages.balanceCard,
          ),
          alignment: Alignment.bottomCenter,
          fit: BoxFit.contain,
        ),
        color: const Color(0xFF42887c),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          const Expanded(child: PieChartView()),
          const Gap(10),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 15,
                          width: 15,
                        ),
                        const Gap(6),
                        AppFont().S(text: '%45 Shopping', color: Colors.white)
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 15,
                          width: 15,
                        ),
                        const Gap(6),
                        AppFont().S(text: '%45 Shopping', color: Colors.white)
                      ],
                    ),
                  ],
                ),
                const Gap(10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 15,
                          width: 15,
                        ),
                        const Gap(6),
                        AppFont().S(text: '%45 Shopping', color: Colors.white)
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 15,
                          width: 15,
                        ),
                        const Gap(6),
                        AppFont().S(text: '%45 Shopping', color: Colors.white)
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),

      //   child: Column(children: []),
    );
  }

  Container _frontSideTopCard() {
    return Container(
      height: 150,
      // width: 400,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              spreadRadius: 3,
              blurRadius: 6,
            ),
          ],
          image: const DecorationImage(
            image: AssetImage(
              AppImages.balanceCard,
            ),
            alignment: Alignment.bottomCenter,
            fit: BoxFit.contain,
          ),
          color: const Color(0xFF42887c),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppFont().S(
                    text: StringConst.availableBal,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  )
                ],
              ),
              AppFont().N(
                text: ' 2,800',
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: AppFont().S(
                text: StringConst.tapForDetail,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              )),
          const SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}
