import 'package:isar/isar.dart';
part 'account.g.dart';

@Collection()
class Account {
  Id id = Isar.autoIncrement;
  late double amount;
  late String note;
  late double accountAmount;
  late String accountName;
  late String image;
}
