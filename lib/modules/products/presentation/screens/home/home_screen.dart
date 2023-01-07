import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_strings.dart';
import 'package:ecommerce_app/modules/products/presentation/screens/home/pages/cart_page.dart';
import 'package:ecommerce_app/modules/products/presentation/screens/home/pages/checkout_page.dart';
import 'package:ecommerce_app/modules/products/presentation/screens/home/pages/products_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = const [
    ProductsPage(),
    CartPage(),
    CheckoutPage(),
  ];

  List<String> titles = [
    AppStrings.products,
    AppStrings.cart,
    AppStrings.checkout,
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
          _title,
          style: Theme.of(context).textTheme.titleSmall,
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
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: AppStrings.products),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: AppStrings.cart),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment), label: AppStrings.checkout),
          ],
        ),
      ),
    );
  }
}
