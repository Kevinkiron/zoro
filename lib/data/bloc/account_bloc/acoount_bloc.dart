import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../isar_service.dart';

part 'acoount_event.dart';
part 'acoount_state.dart';

class AcoountBloc extends Bloc<AcoountEvent, AcoountState> {
  TextEditingController amount = TextEditingController();
  TextEditingController note = TextEditingController();
  final IsarService isarService;
  AcoountBloc(this.isarService) : super(AcoountState()) {
    on<AddAmount>(_onAddAccount);
  }
  void _onAddAccount(AddAmount event, Emitter<AcoountState> emit) async {
    // emit(AccountLoading());
    try {
      await isarService.add(event.note, event.amount);
      //  add(LoadAccounts()); // Reload accounts after adding
    } catch (e) {
      // emit(AccountError("Failed to add account: ${e.toString()}"));
    }
  }
}
