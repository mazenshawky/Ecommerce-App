import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_strings.dart';
import 'package:ecommerce_app/modules/products/presentation/screens/home/pages/cart_page.dart';
import 'package:ecommerce_app/modules/products/presentation/screens/home/pages/checkout_page.dart';
import 'package:ecommerce_app/modules/products/presentation/screens/home/pages/products_page.dart';
import 'package:ecommerce_app/modules/products/presentation/screens/home/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/locale/app_localizations.dart';
import '../../cubit/cart/cart_cubit.dart';
import '../../cubit/products/products_cubit.dart';

class HomeScreen extends StatefulWidget {
  final dynamic userId;

  const HomeScreen({super.key, required this.userId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _getAllProducts() async =>
      await BlocProvider.of<ProductsCubit>(context).getAllProducts();

  _getCart() async =>
      await BlocProvider.of<CartCubit>(context).getCart(widget.userId);

  @override
  void initState() {
    super.initState();
    _getAllProducts();
    _getCart();
  }

  List<Widget> pages = const [
    ProductsPage(),
    CartPage(),
    CheckoutPage(),
    SettingsPage(),
  ];

  List<String> titles = [
    AppStrings.products,
    AppStrings.cart,
    AppStrings.checkout,
    AppStrings.settings,
  ];

  String _title = AppStrings.products;
  var _currentIndex = 0;

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate(_title)!,
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: AppColors.lightGrey, spreadRadius: 1.0),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.grey,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label:
                  AppLocalizations.of(context)!.translate(AppStrings.products)!,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: AppLocalizations.of(context)!.translate(AppStrings.cart)!,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.payment),
              label:
                  AppLocalizations.of(context)!.translate(AppStrings.checkout)!,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label:
                  AppLocalizations.of(context)!.translate(AppStrings.settings)!,
            ),
          ],
        ),
      ),
    );
  }
}
