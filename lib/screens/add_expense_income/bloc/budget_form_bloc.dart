import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/models/AddAccount_mode.dart';

part 'budget_form_event.dart';
part 'budget_form_state.dart';

class BudgetFormBloc extends Bloc<BudgetFormEvent, BudgetFormState> {
  TextEditingController amountController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  BudgetFormBloc() : super(const BudgetFormState()) {
    on<AddAccount>(_addAccount);
    on<SelectImage>(_selectImage);
  }

  void _addAccount(AddAccount event, Emitter<BudgetFormState> emit) {
    final newAccount = AddAccountModel(
      amount: event.amount,
      name: event.name,
      icons: state.selectedImage,
    );
    emit(state.copyWith(
        accountList: List.from(state.accountList)..add(newAccount)));
  }

  void _selectImage(SelectImage event, Emitter<BudgetFormState> emit) {
    emit(state.copyWith(selectedImage: event.selectedImage));
  }
}
