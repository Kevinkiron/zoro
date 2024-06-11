import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home/bloc/home_bloc.dart';

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
              icon: const Icon(Icons.home_rounded),
              title: const Text('Home'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.bar_chart_rounded),
              title: const Text('Statistics'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.account_balance_wallet_rounded),
              title: const Text('Transactions'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
            ),
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
