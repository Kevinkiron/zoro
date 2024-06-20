part of 'budget_form_bloc.dart';

class BudgetFormState extends Equatable {
  final List<AddAccountModel> accountList;
  final List<AddCategoryModel> categoryModel;
  final List<String> images;
  final List<String> expenseIcons;
  final String selectedImage;
  final String selectedExpenseIcon;

  const BudgetFormState({
    this.accountList = const <AddAccountModel>[],
    this.categoryModel = const <AddCategoryModel>[],
    this.selectedImage = '',
    this.selectedExpenseIcon = '',
    this.images = const <String>[
      'assets/png/car.png',
      'assets/png/food.png',
      'assets/png/fuel.png',
      'assets/png/rent.jpg',
      'assets/png/shopping.jpg',
    ],
    this.expenseIcons = const <String>[
      'assets/png/car.png',
      'assets/png/food.png',
      'assets/png/fuel.png',
      'assets/png/rent.jpg',
      'assets/png/shopping.jpg',
    ],
  });
  BudgetFormState copyWith({
    List<AddAccountModel>? accountList,
    List<AddCategoryModel>? categoryModel,
    String? selectedImage,
    String? selectedExpenseIcon,
  }) {
    return BudgetFormState(
      accountList: accountList ?? this.accountList,
      selectedExpenseIcon: selectedExpenseIcon ?? this.selectedExpenseIcon,
      selectedImage: selectedImage ?? this.selectedImage,
      categoryModel: categoryModel ?? this.categoryModel,
    );
  }

  @override
  List<Object> get props => [
        accountList,
        selectedImage,
        images,
        selectedExpenseIcon,
        categoryModel,
      ];
}
