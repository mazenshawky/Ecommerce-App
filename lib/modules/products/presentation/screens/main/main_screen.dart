import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/modules/products/presentation/screens/main/pages/cart_page.dart';
import 'package:ecommerce_app/modules/products/presentation/screens/main/pages/checkout_page.dart';
import 'package:ecommerce_app/modules/products/presentation/screens/main/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = const [
    HomePage(),
    CartPage(),
    CheckoutPage(),
  ];

  List<String> titles = [
    'Home Page',
    'Cart Page',
    'Checkout Page',
  ];

  String _title = 'Home';
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
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment), label: 'Checkout'),
          ],
        ),
      ),
    );
  }
}
