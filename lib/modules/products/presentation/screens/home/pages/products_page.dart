import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/routes/app_routes.dart';
import '../../../cubit/products/products_cubit.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is ProductsLoaded) {
          return ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(Routes.productDetailsRoute, arguments: 2);
              },
              child: const Text('test'));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
