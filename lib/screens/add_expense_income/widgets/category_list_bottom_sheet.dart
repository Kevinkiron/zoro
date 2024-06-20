import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../data/bloc/account_bloc/account_bloc.dart';
import '../../../utils/app_font_styles.dart';
import '../bloc/budget_form_bloc.dart';

class CategoryListBottomSheet extends StatelessWidget {
  const CategoryListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetFormBloc, BudgetFormState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.categoryModel.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _listViewOfAccount(index, state);
              }),
        );
      },
    );
  }

  Widget _listViewOfAccount(index, BudgetFormState state) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, accountState) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                context.read<AccountBloc>().add(AddNewCategory(
                    categoryName: state.categoryModel[index].name,
                    icons: state.categoryModel[index].icons));
                log(state.categoryModel[index].name.toString(), name: 'sa');
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            state.categoryModel[index].icons,
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Gap(15),
                        AppFont().S(
                            text: state.categoryModel[index].name,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Gap(10)
          ],
        );
      },
    );
  }
}
