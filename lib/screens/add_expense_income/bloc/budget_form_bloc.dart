import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/models/add_category_model.dart';
import 'package:flutter/material.dart';

import '../../../data/models/AddAccount_mode.dart';

part 'budget_form_event.dart';
part 'budget_form_state.dart';

class BudgetFormBloc extends Bloc<BudgetFormEvent, BudgetFormState> {
  TextEditingController amountController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController categoryNameController = TextEditingController();
  BudgetFormBloc() : super(const BudgetFormState()) {
    on<AddAccount>(_addAccount);
    on<SelectImage>(_selectImage);
    on<AddCategory>(_addCategory);
    on<SelectExpenseIcon>(_selectExpenseIcon);
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

  void _addCategory(AddCategory event, Emitter<BudgetFormState> emit) {
    final newCategory = AddCategoryModel(
      name: event.name,
      icons: state.selectedImage,
    );
    emit(state.copyWith(
        categoryModel: List.from(state.categoryModel)..add(newCategory)));
  }

  void _selectExpenseIcon(
      SelectExpenseIcon event, Emitter<BudgetFormState> emit) {
    emit(state.copyWith(selectedExpenseIcon: event.selectedExpenseIcon));
  }
}
