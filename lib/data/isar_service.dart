import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/account.dart';
import 'models/expense.dart';

class IsarService {
  static late Isar isar;
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open([AccountSchema, ExpenseSchema], directory: dir.path);
  }
  //  Future<void> saveFirstDate() async {
  //   final exitsSetting = await i
  //   final dir = await getApplicationDocumentsDirectory();
  //   isar = await Isar.open([AccountSchema, ExpenseSchema], directory: dir.path);
  // }

  Future<void> addAccount(String note, double amount, List addAc) async {
    final newAmount = Account()
      ..amount = amount
      ..addAc
      ..note = note;
    await isar.writeTxn(() => isar.accounts.put(newAmount));
    log('Added account with note: $note and amount: $amount');
    await readAmount();
  }

  Future<void> addExpense(String note, double amount) async {
    final newExpense = Expense()
      ..amount = amount
      ..note = note;
    await isar.writeTxn(() => isar.expenses.put(newExpense));
    log('Added account with note: $note and amount: $amount');
    await readExpense();
  }

  Future<List<Account>> readAmount() async {l
    final accounts = await isar.accounts.where().findAll();
    log('Accounts in Isar: ${accounts.map((a) => 'Note: ${a.note}, Amount: ${a.amount}').join(', ')}');
    // currentAccount.clear();
    // currentAccount.add(fetchAmount);
    return accounts;
  }

  Future<List<Expense>> readExpense() async {
    final expense = await isar.expenses.where().findAll();
    log('Expense in Isar: ${expense.map((a) => 'Note: ${a.note}, Amount: ${a.amount}').join(', ')}');
    // currentAccount.clear();
    // currentAccount.add(fetchAmount);
    return expense;
  }

  Future<void> deleteAccount(int id) async {
    await isar.writeTxn(() async {
      await isar.accounts.delete(id);
    });
    readAmount();
  }

  Future<void> deleteExpense(int id) async {
    await isar.writeTxn(() async {
      await isar.expenses.delete(id);
    });
    readAmount();
  }
}
