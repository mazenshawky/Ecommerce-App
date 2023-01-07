import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/modules/products/data/datasource/products_remote_data_source.dart';
import 'package:ecommerce_app/modules/products/domain/entities/cart.dart';
import 'package:ecommerce_app/modules/products/domain/entities/product.dart';
import 'package:ecommerce_app/modules/products/domain/repository/products_repository.dart';
import 'package:ecommerce_app/modules/products/domain/usecases/get_cart_usecase.dart';
import 'package:ecommerce_app/modules/products/domain/usecases/get_product_details_usecase.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final NetworkInfo networkInfo;
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepositoryImpl({
    required this.networkInfo,
    required this.productsRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await productsRemoteDataSource.getAllProducts();
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetails(
      ProductDetailsParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProductDetails =
            await productsRemoteDataSource.getProductDetails(parameters);
        return Right(remoteProductDetails);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Cart>> getCart(CartParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCart = await productsRemoteDataSource.getCart(parameters);
        return Right(remoteCart);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
