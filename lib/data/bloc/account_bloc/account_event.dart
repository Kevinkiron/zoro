part of 'account_bloc.dart';

class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AddAmount extends AccountEvent {
  final String note;
  final double amount;
  final List addAc;
  const AddAmount(this.note, this.amount, this.addAc);

  @override
  List<Object> get props => [note, amount, addAc];
}

class ReadAccount extends AccountEvent {
  const ReadAccount();

  @override
  List<Object> get props => [];
}

class AddExpense extends AccountEvent {
  final String note;
  final double amount;
  const AddExpense(
    this.note,
    this.amount,
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
