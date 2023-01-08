import 'package:flutter/material.dart';

import '../../../../core/utils/app_values.dart';

class MyButton extends StatelessWidget {
  final String text;

  const MyButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppSize.s200,
        height: AppSize.s48,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(text),
        ),
      ),
    );
  }
}
