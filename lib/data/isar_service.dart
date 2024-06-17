import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/account.dart';
import 'models/expense.dart';

class IsarService {
  static late Isar isar;
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbFiles = Directory(dir.path).listSync();
    for (var file in dbFiles) {
      if (file is File && file.path.contains('isar')) {
        await file.delete();
      }
    }
    isar = await Isar.open([AccountSchema, ExpenseSchema], directory: dir.path);
  }
  //  Future<void> saveFirstDate() async {
  //   final exitsSetting = await i
  //   final dir = await getApplicationDocumentsDirectory();
  //   isar = await Isar.open([AccountSchema, ExpenseSchema], directory: dir.path);
  // }

  List currentAccount = [];
  Future<void> add(String note, double amount) async {
    final newAmount = Account()
      ..amount = amount
      ..note = note;
    await isar.writeTxn(() => isar.accounts.put(newAmount));
    await readAmount();
  }

  Future<void> readAmount() async {
    List<Account> fetchAmount = await isar.accounts.where().findAll();
    currentAccount.clear();
    currentAccount.add(fetchAmount);
  }
}
