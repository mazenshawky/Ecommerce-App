import 'package:ecommerce_app/core/utils/app_fonts.dart';
import 'package:ecommerce_app/core/utils/app_values.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Gordita',
    scaffoldBackgroundColor: AppColors.bgColor,
    textTheme: const TextTheme(
        bodyText2: TextStyle(
      color: AppColors.blackColor54,
    )),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: AppSize.s0,
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontSize: FontSize.s20,
        fontWeight: FontWeights.fw500,
      ),
    ),
  );
}
