import 'package:ecommerce_app/core/utils/app_values.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData lightTheme() {
  return ThemeData(
    // main colors
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgorundColor,

    // font
    fontFamily: AppStrings.fontFamily,

    // indicator
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primary),

    // text theme
    textTheme: const TextTheme(
        bodyText2: TextStyle(
      color: AppColors.blackColor54,
    )),

    // app bar theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: AppSize.s0,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: const StadiumBorder(),
      ),
    ),
  );
}
