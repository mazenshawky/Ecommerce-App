import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/product.dart';
import '../repository/products_repository.dart';

class GetProductDetailsUseCase
    implements BaseUseCase<Product, ProductDetailsParameters> {
  final ProductsRepository baseProductsRepository;

  GetProductDetailsUseCase({required this.baseProductsRepository});

  @override
  Future<Either<Failure, Product>> call(
      ProductDetailsParameters parameters) async {
    return await baseProductsRepository.getProductDetails(parameters);
  }
}

class ProductDetailsParameters extends Equatable {
  final int productId;

  const ProductDetailsParameters({required this.productId});

  @override
  List<Object?> get props => [productId];
}
