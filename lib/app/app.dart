import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../config/themes/app_themes.dart';
import '../core/utils/app_strings.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
