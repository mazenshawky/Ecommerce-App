import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/modules/products/data/models/product_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  ApiConsumer apiConsumer;

  ProductsRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await apiConsumer.get(EndPoints.allProductsPath);

    return List<ProductModel>.from(
        (response as List).map((product) => ProductModel.fromJson(product)));
  }
}
