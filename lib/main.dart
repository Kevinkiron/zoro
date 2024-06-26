import 'package:expense_tracker/data/bloc/account_bloc/account_bloc.dart';
import 'package:expense_tracker/data/bloc/home_bloc/home_bloc.dart';
import 'package:expense_tracker/data/bloc/splash_bloc/splash_bloc.dart';
import 'package:expense_tracker/data/isar_service.dart';
import 'package:expense_tracker/screens/add_expense_income/bloc/budget_form_bloc.dart';
import 'package:expense_tracker/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.initialize();
  // await IsarService().saveFirstDate();
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
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
        BlocProvider(
          create: (context) => BudgetFormBloc(),
        ),
        BlocProvider(
          create: (context) => AccountBloc(IsarService())
            ..add(const ReadAccount())
            ..add(const ReadExpense()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: lightMode,
        // darkTheme: darkMode,
        theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0xFFf6f6f6),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFf6f6f6),
            )),
        home: const Splash(),
      ),
    );
  }
}
