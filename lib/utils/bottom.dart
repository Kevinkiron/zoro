import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/bloc/home_bloc/home_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return FlashyTabBar(
          selectedIndex: state.tabIndex,
          iconSize: 30,
          showElevation: true,
          onItemSelected: (index) {
            context.read<HomeBloc>().add(NavigateIndex(index));
          },
          items: [
            FlashyTabBarItem(
              activeColor: Colors.green,
              icon: const Icon(
                Icons.home_rounded,
              ),
              title: AppFont().S(text: 'Home'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.account_balance_wallet_rounded),
              title: AppFont().S(text: 'Transaction'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.bar_chart_rounded),
              title: AppFont().S(text: 'Statistic'),
            ),
            FlashyTabBarItem(
                icon: const Icon(Icons.local_grocery_store_sharp),
                title: AppFont().S(text: 'Budget')),
          ],
        );
      },
    );

    //  BottomNavigationBar(
    //   elevation: 40,
    //   type: BottomNavigationBarType.fixed,
    //   currentIndex: 1,
    //   unselectedItemColor: Colors.black,
    //   items: const [
    //     BottomNavigationBarItem(
    //       label: '',
    //       icon: Icon(Icons.home_outlined),
    //     ),
    //     BottomNavigationBarItem(
    //       label: '',
    //       icon: Icon(Icons.calendar_today),
    //     ),
    //     BottomNavigationBarItem(
    //       label: '',
    //       icon: Icon(Icons.wallet),
    //     ),
    //     BottomNavigationBarItem(
    //       label: '',
    //       icon: Icon(Icons.person_outline_outlined),
    //     ),
    //   ],
    // );
  }
}
