part of 'account_bloc.dart';

enum Status { initial, success, failure }

final class AccountState extends Equatable {
  final Status status;
  final List<Account> accounts;
  final List<Expense> expense;
  final List<AddAccountModel> addAccount;
  const AccountState({
    this.addAccount = const <AddAccountModel>[],
    this.accounts = const <Account>[],
    this.expense = const <Expense>[],
    this.status = Status.initial,
  });
  AccountState copyWith({
    List<Account>? accounts,
    List<AddAccountModel>? addAccount,
    List<Expense>? expense,
    Status? status,
  }) {
    return AccountState(
      addAccount: addAccount ?? this.addAccount,
      accounts: accounts ?? this.accounts,
      expense: expense ?? this.expense,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        accounts,
        expense,
        status,
        addAccount,
      ];
}
