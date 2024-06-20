import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../data/bloc/account_bloc/account_bloc.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocBuilder<AccountBloc, AccountState>(
            builder: (context, state) {
              return Column(
                children: [
                  const Gap(30),
                  EasyDateTimeLine(
                    initialDate: DateTime.now(),
                  ),
                  const Gap(10),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: TabBar(
                      splashFactory: NoSplash.splashFactory,
                      indicatorSize: TabBarIndicatorSize.tab,
                      enableFeedback: false,
                      dividerColor: Colors.transparent,
                      indicator: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xFF42887c),
                            Color(0xFF42887c),
                          ]),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      tabs: [
                        Tab(
                            child: AppFont().S(
                                text: 'Expenses',
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Tab(
                            child: AppFont().S(
                                text: 'Income',
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      ListView.builder(
                        itemCount: state.expense.length,
                        padding: EdgeInsets.only(top: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Card(
                                elevation: 0,
                                color: Colors.white,
                                child: ListTile(
                                  trailing: Text(
                                      state.expense[index].amount.toString()),
                                  title:
                                      Text(state.expense[index].categoryName),
                                  subtitle: Text(state.expense[index].note),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      state.expense[index].image,
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(7)
                            ],
                          );
                        },
                      ),
                      _incomeTab(state),
                    ]),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  ListView _incomeTab(AccountState state) {
    return ListView.builder(
      itemCount: state.accounts.length,
      padding: EdgeInsets.only(top: 10),
      itemBuilder: (BuildContext context, int index) {
        return _incomeCardBuild(state, index);
      },
    );
  }

  Column _incomeCardBuild(AccountState state, index) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: Colors.white,
          child: ListTile(
            trailing: Text(state.accounts[index].amount.toString()),
            title: Text(state.accounts[index].accountName),
            subtitle: Text(state.accounts[index].note),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                state.accounts[index].image,
                width: 80,
                height: 80,
              ),
            ),
          ),
        ),
        const Gap(7)
      ],
    );
  }
}
