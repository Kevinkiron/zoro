import 'package:expense_tracker/screens/home/home.dart';
import 'package:expense_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'bloc/splash_bloc.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().add(const NavigateToHome());
    return BlocConsumer<SplashBloc, SplashState>(listener: (context, state) {
      if (state.status == Status.success) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        });
      }
    }, builder: (context, state) {
      return Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container()
          // Lottie.asset(
          //   'assets/images/splash.json',
          //   fit: BoxFit.cover,
          // ),
        ],
      ));
    });
  }
}
