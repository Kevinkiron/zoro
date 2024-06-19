part of 'budget_form_bloc.dart';

class BudgetFormEvent extends Equatable {
  const BudgetFormEvent();

  @override
  List<Object> get props => [];
}

class AddAccount extends BudgetFormEvent {
  final String name;
  final double amount;
  final String icons;
  AddAccount(
    this.amount,
    this.name,
    this.icons,
  );
  @override
  List<Object> get props => [amount, name, icons];
}

class SelectImage extends BudgetFormEvent {
  final String selectedImage;

  SelectImage({required this.selectedImage});

  @override
  List<Object> get props => [selectedImage];
}
