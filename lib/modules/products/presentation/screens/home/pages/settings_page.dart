import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/locale/app_localizations.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/app_values.dart';
import '../../../../../localization/presentation/cubit/locale_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _changeLanguage(BuildContext context) {
    if (AppLocalizations.of(context)!.isEnLocale) {
      BlocProvider.of<LocaleCubit>(context).toArabic();
    } else {
      BlocProvider.of<LocaleCubit>(context).toEnglish();
    }
  }

  void _contactUs() {}

  void _inviteFriends() {}

  void _logout() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(AppPadding.p8),
        children: [
          ListTile(
            leading:
                const Icon(Icons.language_outlined, color: AppColors.primary),
            trailing: const Icon(Icons.arrow_forward_ios_outlined,
                color: AppColors.primary, size: AppSize.s20),
            title: Text(
              AppLocalizations.of(context)!
                  .translate(AppStrings.changeLanguage)!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () => _changeLanguage(context),
          ),
          ListTile(
            leading: const Icon(Icons.call_missed_outgoing_outlined,
                color: AppColors.primary),
            trailing: const Icon(Icons.arrow_forward_ios_outlined,
                color: AppColors.primary, size: AppSize.s20),
            title: Text(
              AppLocalizations.of(context)!.translate(AppStrings.contactUs)!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () => _contactUs(),
          ),
          ListTile(
            leading: const Icon(Icons.share_outlined, color: AppColors.primary),
            trailing: const Icon(Icons.arrow_forward_ios_outlined,
                color: AppColors.primary, size: AppSize.s20),
            title: Text(
              AppLocalizations.of(context)!
                  .translate(AppStrings.inviteYourFriends)!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () => _inviteFriends(),
          ),
          ListTile(
            leading:
                const Icon(Icons.logout_outlined, color: AppColors.primary),
            trailing: const Icon(Icons.arrow_forward_ios_outlined,
                color: AppColors.primary, size: AppSize.s20),
            title: Text(
              AppLocalizations.of(context)!.translate(AppStrings.logout)!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () => _logout(),
          ),
        ],
      ),
    );
  }
}
