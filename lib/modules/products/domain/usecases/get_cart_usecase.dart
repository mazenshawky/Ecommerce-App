import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/cart.dart';
import '../repository/products_repository.dart';

class GetCartUseCase implements BaseUseCase<Cart, NoParameters> {
  final ProductsRepository baseProductsRepository;

  GetCartUseCase({required this.baseProductsRepository});

  @override
  Future<Either<Failure, Cart>> call(NoParameters parameters) async {
    return await baseProductsRepository.getCart();
  }
}
