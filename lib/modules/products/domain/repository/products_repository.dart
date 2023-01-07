import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/modules/products/domain/entities/cart.dart';
import 'package:ecommerce_app/modules/products/domain/entities/product.dart';

import '../../../../core/error/failure.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();

  Future<Either<Failure, Cart>> getCart();
}
