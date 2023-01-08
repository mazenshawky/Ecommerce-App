import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/locale/app_localizations_setup.dart';
import '../config/themes/app_themes.dart';
import '../core/utils/app_strings.dart';

import '../modules/localization/presentation/cubit/locale_cubit.dart';
import 'injection_container.dart' as di;

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => di.sl<LocaleCubit>()..getSavedLang()),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return MaterialApp(
            title: AppStrings.appName,
            locale: state.locale,
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
