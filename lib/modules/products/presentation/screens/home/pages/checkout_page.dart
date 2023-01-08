import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_strings.dart';
import 'package:ecommerce_app/modules/products/presentation/components/my_button.dart';
import 'package:ecommerce_app/modules/products/presentation/components/my_divider.dart';
import 'package:ecommerce_app/modules/products/presentation/components/my_header.dart';
import 'package:flutter/material.dart';

import '../../../../../../config/locale/app_localizations.dart';
import '../../../../../../core/utils/app_values.dart';
import '../../../components/my_text_field.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int? value = 0;

  final paymentLabels = [
    AppStrings.creditOrDebitCard,
    AppStrings.cashOnDelivery,
    AppStrings.paypal,
    AppStrings.googleWallet,
  ];

  final paymentIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.payment,
    Icons.account_balance_wallet,
  ];

  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();

  final GlobalKey<FormState> _checkoutFormKey = GlobalKey();

  Widget _buildPaymentMethodListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: paymentLabels.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Radio(
              activeColor: AppColors.primary,
              value: index,
              groupValue: value,
              onChanged: (i) => setState(() => value = i),
            ),
            title: Text(
              paymentLabels[index],
            ),
            trailing: Icon(paymentIcons[index], color: AppColors.primary),
          );
        },
        separatorBuilder: (context, index) {
          return const MyDivider();
        },
      ),
    );
  }

  void _pay() {
    if (!_checkoutFormKey.currentState!.validate()) {
      return;
    } else {
      _checkoutFormKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _checkoutFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyHeader(
            text: AppLocalizations.of(context)!
                .translate(AppStrings.shippingAddress)!,
          ),
          const SizedBox(height: AppSize.s10),
          MyTextField(
            controller: countryController,
            invalidInput: AppLocalizations.of(context)!
                .translate(AppStrings.countryInvalid)!,
            hintText:
                AppLocalizations.of(context)!.translate(AppStrings.country)!,
          ),
          const SizedBox(height: AppSize.s10),
          MyTextField(
            controller: cityController,
            invalidInput: AppLocalizations.of(context)!
                .translate(AppStrings.cityInvalid)!,
            hintText: AppLocalizations.of(context)!.translate(AppStrings.city)!,
          ),
          const SizedBox(height: AppSize.s10),
          MyTextField(
            controller: zipCodeController,
            invalidInput: AppLocalizations.of(context)!
                .translate(AppStrings.zipCodeInvalid)!,
            hintText:
                AppLocalizations.of(context)!.translate(AppStrings.zipCode)!,
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 50),
          MyHeader(
            text: AppLocalizations.of(context)!
                .translate(AppStrings.paymentMethod)!,
          ),
          _buildPaymentMethodListView(),
          const SizedBox(height: AppSize.s10),
          MyButton(
            text: AppLocalizations.of(context)!.translate(AppStrings.pay)!,
            onPress: () => _pay(),
          ),
          const SizedBox(height: AppSize.s13),
        ],
      ),
    );
  }
}
