import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/modules/products/domain/entities/cart.dart';
import 'package:ecommerce_app/modules/products/domain/entities/product.dart';
import 'package:ecommerce_app/modules/products/domain/usecases/get_cart_usecase.dart';
import 'package:ecommerce_app/modules/products/domain/usecases/get_product_details_usecase.dart';

import '../../../../core/error/failure.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();

  Future<Either<Failure, Product>> getProductDetails(
      ProductDetailsParameters parameters);

  Future<Either<Failure, Cart>> getCart(CartParameters parameters);
}
