import 'dart:developer';

import 'package:expense_tracker/screens/add_expense_income/bloc/budget_form_bloc.dart';
import 'package:expense_tracker/screens/add_expense_income/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../utils/app_font_styles.dart';

// ignore: must_be_immutable
class CustomAlertDialogAddAccount extends StatelessWidget {
  const CustomAlertDialogAddAccount({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetFormBloc, BudgetFormState>(
      builder: (context, state) {
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
                      controller:
                          context.read<BudgetFormBloc>().amountController,
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
                      controller:
                          context.read<BudgetFormBloc>().accountNameController,
                      hintText: 'Account Name',
                    ),
                  ),
                ],
              ),
              const Gap(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(state.images.length, (index) {
                    log(state.images.length.toString());
                    return _buildImages(state, index, context);
                  }),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                context.read<BudgetFormBloc>().add(AddAccount(
                      double.parse(
                        context.read<BudgetFormBloc>().amountController.text,
                      ),
                      context.read<BudgetFormBloc>().accountNameController.text,
                      state.selectedImage,
                    ));
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildImages(BudgetFormState state, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<BudgetFormBloc>()
            .add(SelectImage(selectedImage: state.images[index]));
        log(state.images[index].toString(), name: 'dcd');
      },
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
          const Gap(10),
        ],
      ),
    );
  }
}
