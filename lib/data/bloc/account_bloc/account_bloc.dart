import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/models/add_category_model.dart';
import 'package:expense_tracker/data/models/expense.dart';
import 'package:flutter/material.dart';

import '../../isar_service.dart';
import '../../models/AddAccount_mode.dart';
import '../../models/account.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  TextEditingController amount = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController expenseAmount = TextEditingController();
  TextEditingController expenseNote = TextEditingController();
  final IsarService isarService;
  AccountBloc(this.isarService) : super(const AccountState()) {
    on<AddAmount>(_onAddAccount);
    on<ReadAccount>(_onLoadAccounts);
    on<AddAccountDetails>(_onAddAccountDetails);
    on<AddExpense>(_onAddExpense);
    on<ReadExpense>(_onLoadExpense);
    on<AddNewCategory>(_onAddCategoryDetails);
    on<DeleteExpense>(_onDeleteExpense);
  }
  void _onAddAccount(AddAmount event, Emitter<AccountState> emit) async {
    try {
      await isarService.addAccount(
          event.note, event.amount, state.accAmt, state.accName, state.image);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _onLoadAccounts(ReadAccount event, Emitter<AccountState> emit) async {
    try {
      var res = await isarService.readAmount();
      log(res.toString());
      emit(state.copyWith(accounts: res, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

// to get the new account details from the user and saving it to pass to add account
  void _onAddAccountDetails(
      AddAccountDetails event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(
          accAmt: event.accountAmount,
          accName: event.accountName,
          image: event.image,
          selectedAccountName: event.selectedAccountName));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _onAddExpense(AddExpense event, Emitter<AccountState> emit) async {
    try {
      await isarService.addExpense(
          event.note, event.amount, state.accName, state.categoryImage);
      add(const ReadExpense());
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _onAddCategoryDetails(
      AddNewCategory event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(
          categoryName: event.categoryName, categoryImage: event.icons));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _onLoadExpense(ReadExpense event, Emitter<AccountState> emit) async {
    try {
      var res = await isarService.readExpense();
      log(res.toString());
      emit(state.copyWith(
        expense: res,
        status: Status.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _onDeleteExpense(DeleteExpense event, Emitter<AccountState> emit) async {
    try {
      await isarService.deleteExpense(event.id);
      add(const ReadExpense());
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
