import 'package:ecommerce_app/modules/products/presentation/cubit/product_details/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  final dynamic productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  _getProductDetails() async =>
      await BlocProvider.of<ProductDetailsCubit>(context)
          .getProductDetails(widget.productId);

  @override
  void initState() {
    super.initState();
    _getProductDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
