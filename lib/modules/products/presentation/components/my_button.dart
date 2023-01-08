import 'package:flutter/material.dart';

import '../../../../core/utils/app_values.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;

  const MyButton({
    super.key,
    required this.text,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppSize.s200,
        height: AppSize.s48,
        child: ElevatedButton(
          onPressed: () {
            if (onPress != null) {
              onPress!();
            }
          },
          child: Text(text),
        ),
      ),
    );
  }
}
