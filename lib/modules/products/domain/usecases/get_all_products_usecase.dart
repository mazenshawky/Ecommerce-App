import 'package:ecommerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecases/base_usecase.dart';
import 'package:ecommerce_app/modules/products/domain/entities/product.dart';
import 'package:ecommerce_app/modules/products/domain/repository/base_products_repository.dart';

class GetAllProductsUseCase
    implements BaseUseCase<List<Product>, NoParameters> {
  final BaseProductsRepository baseProductsRepository;

  GetAllProductsUseCase({required this.baseProductsRepository});

  @override
  Future<Either<Failure, List<Product>>> call(NoParameters parameters) async {
    return await baseProductsRepository.getAllProducts();
  }
}
