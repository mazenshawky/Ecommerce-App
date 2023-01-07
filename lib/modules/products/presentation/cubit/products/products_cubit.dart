// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecases/base_usecase.dart';
import 'package:ecommerce_app/modules/products/domain/usecases/get_all_products_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/product.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  ProductsCubit({required this.getAllProductsUseCase})
      : super(ProductsInitial());

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    Either<Failure, List<Product>> response =
        await getAllProductsUseCase(const NoParameters());

    emit(response.fold(
        (failure) => ProductsError(message: _mapFailureToMsg(failure)),
        (products) => ProductsLoaded(products: products)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      case InternetFailure:
        return AppStrings.internetFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
