import 'package:expense_tracker/screens/home/bloc/home_bloc.dart';
import 'package:expense_tracker/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: lightMode,
        // darkTheme: darkMode,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        home: const Home(),
      ),
    );
  }
}
