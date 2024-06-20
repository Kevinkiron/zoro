part of 'account_bloc.dart';

enum Status { initial, success, failure }

final class AccountState extends Equatable {
  final Status status;
  final List<Account> accounts;
  final List<Expense> expense;
  final List<AddAccountModel> addAccount;
  final String image;
  final String accName;
  final double accAmt;
  final String categoryImage;
  final String categoryName;
  const AccountState({
    this.addAccount = const <AddAccountModel>[],
    this.accounts = const <Account>[],
    this.expense = const <Expense>[],
    this.status = Status.initial,
    this.accAmt = 0,
    this.image = '',
    this.accName = '',
    this.categoryImage = '',
    this.categoryName = '',
  });
  AccountState copyWith({
    List<Account>? accounts,
    List<AddAccountModel>? addAccount,
    List<Expense>? expense,
    Status? status,
    String? image,
    String? accName,
    double? accAmt,
    String? categoryImage,
    String? categoryName,
  }) {
    return AccountState(
      addAccount: addAccount ?? this.addAccount,
      accounts: accounts ?? this.accounts,
      expense: expense ?? this.expense,
      status: status ?? this.status,
      accAmt: accAmt ?? this.accAmt,
      accName: accName ?? this.accName,
      image: image ?? this.image,
      categoryImage: categoryImage ?? this.categoryImage,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  List<Object> get props => [
        accounts,
        expense,
        status,
        addAccount,
        accAmt,
        accName,
        image,
        categoryImage,
        categoryName,
      ];
}
