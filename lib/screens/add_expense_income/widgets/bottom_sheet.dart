import 'dart:developer';

import 'package:expense_tracker/screens/add_expense_income/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../data/bloc/account_bloc/account_bloc.dart';
import '../../../utils/app_font_styles.dart';

class CustomAlertDialogAddAccount extends StatelessWidget {
  CustomAlertDialogAddAccount(
      {super.key, this.amountController, this.accountNameController});
  TextEditingController? amountController;
  TextEditingController? accountNameController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        log(
          state.images.length.toString(),
        );
        return AlertDialog(
          elevation: 18,
          scrollable: true,
          title: AppFont().S(text: 'Add New Account'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Text('Amount')),
                  const Gap(10),
                  Expanded(
                    flex: 3,
                    child: CustomTextfield(
                      controller: amountController,
                      hintText: 'Amount',
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Text('Name')),
                  const Gap(10),
                  Expanded(
                    flex: 3,
                    child: CustomTextfield(
                      controller: accountNameController,
                      hintText: 'Account Name',
                    ),
                  ),
                ],
              ),
              Gap(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(state.images.length, (index) {
                    log(state.images.length.toString());
                    return _buildImages(state, index);
                  }),
                ),
              ),
              // const Icon(Icons.abc),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildImages(AccountState state, int index) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.asset(
                state.images[index].toString(),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              )),
          Gap(10),
        ],
      ),
    );
  }
}
