import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../isar_service.dart';
import '../../models/account.dart';

part 'acoount_event.dart';
part 'acoount_state.dart';

class AcoountBloc extends Bloc<AcoountEvent, AcoountState> {
  TextEditingController amount = TextEditingController();
  TextEditingController note = TextEditingController();
  final IsarService isarService;
  AcoountBloc(this.isarService) : super(AcoountState()) {
    on<AddAmount>(_onAddAccount);
    on<ReadAccount>(_onLoadAccounts);
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

  void _onLoadAccounts(ReadAccount event, Emitter<AcoountState> emit) async {
    //emit(AccountLoading());
    try {
      var res = await isarService.readAmount();
      emit(state.copyWith(accounts: res));
    } catch (e) {
      //  emit(AccountError("Failed to load accounts: ${e.toString()}"));
    }
  }
}
