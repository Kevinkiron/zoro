import 'package:flutter/material.dart';

import '../../../utils/app_font_styles.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  CustomTextfield({super.key, this.controller, this.hintText, this.maxLines});
  TextEditingController? controller;
  String? hintText;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        hintText: hintText,
        hintStyle: TextStyle(
          fontStyle: AppFont().S(text: '').style?.fontStyle,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
