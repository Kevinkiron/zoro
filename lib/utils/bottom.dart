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
        return DecoratedBox(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFFcdd1ff),
            Color(0xFFf0cdff),
          ])),
          child: FlashyTabBar(
            backgroundColor: Colors.transparent,
            selectedIndex: state.tabIndex,
            iconSize: 30,
            animationDuration: const Duration(milliseconds: 500),
            showElevation: true,
            onItemSelected: (index) {
              context.read<HomeBloc>().add(NavigateIndex(index));
            },
            items: [
              FlashyTabBarItem(
                activeColor: Color(0xFF8E44B6),
                inactiveColor: Colors.white,
                icon: state.tabIndex == 0
                    ? SizedBox()
                    : const Icon(
                        Icons.home_rounded,
                      ),
                title: AppFont().S(text: 'Home', color: Color(0xFF8E44B6)),
              ),
              FlashyTabBarItem(
                activeColor: const Color(0xFF8E44B6),
                inactiveColor: Colors.white,
                icon: state.tabIndex == 1
                    ? const SizedBox()
                    : const Icon(Icons.account_balance_wallet_rounded),
                title:
                    AppFont().S(text: 'Transaction', color: Color(0xFF8E44B6)),
              ),
              FlashyTabBarItem(
                activeColor: const Color(0xFF8E44B6),
                inactiveColor: Colors.white,
                icon: state.tabIndex == 2
                    ? const SizedBox()
                    : const Icon(Icons.bar_chart_rounded),
                title: AppFont().S(text: 'Statistic', color: Color(0xFF8E44B6)),
              ),
              FlashyTabBarItem(
                  activeColor: const Color(0xFF8E44B6),
                  inactiveColor: Colors.white,
                  icon: state.tabIndex == 3
                      ? const SizedBox()
                      : const Icon(Icons.local_grocery_store_sharp),
                  title: AppFont().S(text: 'Budget', color: Color(0xFF8E44B6))),
            ],
          ),
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
