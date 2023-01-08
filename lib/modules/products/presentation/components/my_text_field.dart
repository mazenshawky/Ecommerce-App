import 'package:ecommerce_app/core/utils/app_values.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String invalidInput;
  final String hintText;

  const MyTextField({
    super.key,
    required this.controller,
    this.textInputType = TextInputType.text,
    required this.invalidInput,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: textInputType,
        cursorColor: AppColors.primary,
        validator: (value) => value!.isEmpty ? invalidInput : null,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
