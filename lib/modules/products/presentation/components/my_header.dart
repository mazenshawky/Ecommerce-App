import 'package:flutter/material.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_values.dart';

class MyHeader extends StatelessWidget {
  final String text;

  const MyHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: Text(
        text,
        style: const TextStyle(fontSize: FontSize.s17),
      ),
    );
  }
}
