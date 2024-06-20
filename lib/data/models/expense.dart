import 'package:isar/isar.dart';
part 'expense.g.dart';

@Collection()
class Expense {
  Id id = Isar.autoIncrement;
  late double amount;
  late String note;
  late String categoryName;
  late String image;
}
