import 'package:expense_tracker/screens/home/bloc/home_bloc.dart';
import 'package:expense_tracker/utils/bar_chart.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../utils/bottom.dart';
import '../../utils/constants.dart';
import '../../utils/floating_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: const BottomNavBar(),
          //  backgroundColor: const Color(0xFFf6f6f6),
          body: state.pages[state.tabIndex],
          floatingActionButton: FloatButton(),
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(week),
                    Text(
                      dateMonth,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Icon(Icons.notification_add_outlined)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: FlipCard(
                direction: FlipDirection.HORIZONTAL,
                speed: 600,
                front: _frontSideTopCard(),
                back: _backSideTopCard(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xFFd9e7e5),
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
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
                        const Text(
                          '1,800.00',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text("Income"),
                      ],
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xFFe6e2e6),
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0xFF836f81),
                          child: Image.asset(
                            AppImages.walletIcon,
                            height: 80,
                            width: 30,
                          ),
                        ),
                        const Text(
                          '1,800.00',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text("Expense"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                  color: const Color(0xFF1d2a30),
                  borderRadius: BorderRadius.circular(20)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Budget For Today',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Cash Available',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '2,478',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const BarChartView(),
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
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(
            AppImages.balanceCard,
          ),
          alignment: Alignment.bottomCenter,
          fit: BoxFit.contain,
        ),
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available Balance",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  )
                ],
              ),
              Text(
                " 2,800",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "tap for detail",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          )
        ],
      ),
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
          image: const DecorationImage(
            image: AssetImage(
              AppImages.balanceCard,
            ),
            alignment: Alignment.bottomCenter,
            fit: BoxFit.contain,
          ),
          color: Colors.black,
          borderRadius: BorderRadius.circular(20)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available Balance",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  )
                ],
              ),
              Text(
                " 2,800",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "tap for detail",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}
