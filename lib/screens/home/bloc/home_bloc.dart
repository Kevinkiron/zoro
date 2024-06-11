import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/screens/home/home.dart';
import 'package:expense_tracker/screens/transactions/transaction.dart';
import 'package:flutter/material.dart';

import '../../budget/budget.dart';
import '../../statistics/statistics.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<NavigateIndex>(_bottomChange);
  }

  _bottomChange(NavigateIndex event, Emitter<HomeState> emit) {
    emit(state.copWith(tabIndex: event.selectIndex));
  }
}
