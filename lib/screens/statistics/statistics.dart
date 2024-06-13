import 'package:expense_tracker/utils/app_font_styles.dart';
import 'package:expense_tracker/utils/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: AppFont().S(
                text: 'Statistics'.toUpperCase(),
              ),
            ),
            const Gap(20),
            AppFont().S(text: 'Expenses Average'.toUpperCase()),
            Row(
              children: [
                AppFont().N(
                  text: '33,000'.toUpperCase(),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const Gap(10),
                const Icon(
                  Icons.arrow_drop_down_circle_sharp,
                  color: Colors.redAccent,
                )
              ],
            ),
            const Gap(10),
            const TabBar(
              tabs: [
                Tab(
                  text: 'WEEKLY',
                ),
                Tab(
                  text: 'MONTHLY',
                )
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BarChartView(),
                    const Gap(10),
                    AppFont().S(
                        text: ' CATEGORIES',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    const Gap(10),
                    Expanded(
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: 4,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return ListTile(
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
                            );
                          }),
                    )
                  ],
                ),
                const Column(
                  children: [],
                ),
              ]),
            )
          ],
        ),
      )),
    );
  }
}
