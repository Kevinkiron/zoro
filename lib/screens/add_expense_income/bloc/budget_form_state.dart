part of 'budget_form_bloc.dart';

class BudgetFormState extends Equatable {
  final List<AddAccountModel> accountList;
  final List<String> images;
  final String selectedImage;

  const BudgetFormState({
    this.accountList = const <AddAccountModel>[],
    this.selectedImage = '',
    this.images = const <String>[
      'assets/png/car.png',
      'assets/png/food.png',
      'assets/png/fuel.png',
      'assets/png/rent.jpg',
      'assets/png/shopping.jpg',
    ],
  });
  BudgetFormState copyWith({
    List<AddAccountModel>? accountList,
    String? selectedImage,
  }) {
    return BudgetFormState(
      accountList: accountList ?? this.accountList,
      selectedImage: selectedImage ?? this.selectedImage,
    );
  }

  @override
  List<Object> get props => [accountList, selectedImage, images];
}
