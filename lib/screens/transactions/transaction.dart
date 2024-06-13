import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFf6f6f6),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Gap(50),
              EasyDateTimeLine(
                initialDate: DateTime.now(),
              ),
              const Gap(10),
              const Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: TabBar(
                  splashFactory: NoSplash.splashFactory,
                  indicatorSize: TabBarIndicatorSize.tab,
                  enableFeedback: false,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                      color: Color.fromARGB(255, 123, 212, 197),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  tabs: [
                    Tab(
                      child: Text('Expenses'),
                    ),
                    Tab(
                      child: Text('Incomes'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  ListView.builder(
                    itemCount: 6,
                    padding: EdgeInsets.only(top: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Card(
                            elevation: 6,
                            color: Colors.white,
                            child: ListTile(
                              trailing: const Text('data'),
                              title: const Text('Shopping'),
                              subtitle: const Text('Description'),
                              leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 145, 232, 148),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(Icons.ac_unit_sharp)),
                            ),
                          ),
                          const Gap(7)
                        ],
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 6,
                    padding: EdgeInsets.only(top: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Card(
                            elevation: 6,
                            color: Colors.white,
                            child: ListTile(
                              trailing: const Text('data'),
                              title: const Text('Shopping'),
                              subtitle: const Text('Description'),
                              leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF91E894),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(Icons.ac_unit_sharp)),
                            ),
                          ),
                          const Gap(7)
                        ],
                      );
                    },
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
