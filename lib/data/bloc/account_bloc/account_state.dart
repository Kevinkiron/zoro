part of 'account_bloc.dart';

enum Status { initial, success, failure }

final class AccountState extends Equatable {
  final Status status;
  final List<Account> accounts;
  final List<Expense> expense;
  final List<AddAccountModel> addAccount;
  final List<AddCategoryModel> addCategory;
  final String image;
  final String accName;
  final String selectedAccountName;
  final double accAmt;
  final String categoryImage;
  final String categoryName;
  const AccountState({
    this.addAccount = const <AddAccountModel>[],
    this.addCategory = const <AddCategoryModel>[],
    this.accounts = const <Account>[],
    this.expense = const <Expense>[],
    this.status = Status.initial,
    this.accAmt = 0,
    this.image = '',
    this.accName = '',
    this.categoryImage = '',
    this.categoryName = '',
    this.selectedAccountName = '',
  });
  AccountState copyWith({
    List<Account>? accounts,
    List<AddAccountModel>? addAccount,
    List<AddCategoryModel>? addCategory,
    List<Expense>? expense,
    Status? status,
    String? image,
    String? accName,
    String? selectedAccountName,
    double? accAmt,
    String? categoryImage,
    String? categoryName,
  }) {
    return AccountState(
      addAccount: addAccount ?? this.addAccount,
      addCategory: addCategory ?? this.addCategory,
      selectedAccountName: selectedAccountName ?? this.selectedAccountName,
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
        addCategory,
        selectedAccountName,
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
