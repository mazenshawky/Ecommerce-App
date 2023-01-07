// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/modules/products/domain/entities/cart.dart';
import 'package:ecommerce_app/modules/products/domain/usecases/get_cart_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecases/base_usecase.dart';
import '../../../../../core/utils/constants.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;
  CartCubit({required this.getCartUseCase}) : super(CartInitial());

  Future<void> getCart() async {
    emit(CartLoading());
    Either<Failure, Cart> response = await getCartUseCase(const NoParameters());

    emit(response.fold(
        (failure) => CartError(message: Constants.mapFailureToMsg(failure)),
        (cart) => CartLoaded(cart: cart)));
  }
}
