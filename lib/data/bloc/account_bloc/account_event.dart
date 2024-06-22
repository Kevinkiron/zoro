part of 'account_bloc.dart';

class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AddAmount extends AccountEvent {
  final String note;
  final double amount;
  final List<AddAccountModel> addAc;
  const AddAmount(this.note, this.amount, this.addAc);

  @override
  List<Object> get props => [note, amount, addAc];
}

class ReadAccount extends AccountEvent {
  const ReadAccount();

  @override
  List<Object> get props => [];
}

class AddAccountDetails extends AccountEvent {
  final double accountAmount;
  final String accountName;
  final String image;
  final String selectedAccountName;
  const AddAccountDetails({
    required this.accountAmount,
    required this.accountName,
    required this.image,
    required this.selectedAccountName,
  });

  @override
  List<Object> get props => [accountAmount, accountName, image];
}

class AddNewCategory extends AccountEvent {
  final String categoryName;
  final String icons;
  const AddNewCategory({
    required this.categoryName,
    required this.icons,
  });

  @override
  List<Object> get props => [categoryName, icons];
}

class AddExpense extends AccountEvent {
  final String note;
  final double amount;
  final List<AddCategoryModel> addCat;
  const AddExpense(
    this.note,
    this.amount,
    this.addCat,
  );

  @override
  List<Object> get props => [note, amount];
}

class ReadExpense extends AccountEvent {
  const ReadExpense();

  @override
  List<Object> get props => [];
}

class ResetState extends AccountEvent {
  const ResetState();

  @override
  List<Object> get props => [];
}

class DeleteExpense extends AccountEvent {
  final int id;
  const DeleteExpense(this.id);

  @override
  List<Object> get props => [id];
}

class AddNewAccount extends AccountEvent {
  final String note;
  final double amount;
  final List<String> icons;

  AddNewAccount(this.note, this.amount, this.icons);

  @override
  List<Object> get props => [note, amount, icons];
}
