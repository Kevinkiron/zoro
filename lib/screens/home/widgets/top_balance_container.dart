import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/app_font_styles.dart';
import '../../../utils/constants.dart';
import '../../../utils/pie_chart.dart';
import '../../../utils/string_const.dart';

class TopContainerWithBalance extends StatelessWidget {
  const TopContainerWithBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      speed: 1000,
      front: _frontSideTopCard(),
      back: _backSideTopCard(),
    );
  }

  Container _backSideTopCard() {
    return Container(
      height: 180,
      // width: 400,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 0),
            spreadRadius: 1,
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
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2e15ff),
            Color(0xFF9900e6),
          ],
        ),
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
      height: 180,
      // width: 400,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              spreadRadius: 1,
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
          gradient: const LinearGradient(
            colors: [
              Color(0xFF2e15ff),
              //  Color(0xFF2e15ff),
              Color(0xFF9900e6),
            ],
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const SizedBox(
          //   height: 10,
          // ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppFont().S(
                    text: 'Budget for the Month',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: AppFont().S(
                        text: 'Cash Remaining',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                ],
              ),
              AppFont().N(
                text: '2300',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ],
          ),
          // const SizedBox(
          //   height: 4,
          // )
        ],
      ),
    );
  }
}
