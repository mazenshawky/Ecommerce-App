import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/app_interceptors.dart';
import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/modules/products/data/datasource/products_remote_data_source.dart';
import 'package:ecommerce_app/modules/products/data/repository/products_repository_impl.dart';
import 'package:ecommerce_app/modules/products/domain/repository/products_repository.dart';
import 'package:ecommerce_app/modules/products/domain/usecases/get_all_products_usecase.dart';
import 'package:ecommerce_app/modules/products/presentation/cubit/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'bloc_observer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Modules
  // Blocs
  sl.registerFactory<ProductsCubit>(
      () => ProductsCubit(getAllProductsUseCase: sl()));

  // Use Cases
  sl.registerLazySingleton<GetAllProductsUseCase>(
      () => GetAllProductsUseCase(baseProductsRepository: sl()));

  // Repositories
  sl.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(
        networkInfo: sl(),
        productsRemoteDataSource: sl(),
      ));

  // Data Sources
  sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(apiConsumer: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AppBlocObserver());
}

void initBlocObserver() {
  Bloc.observer = sl<AppBlocObserver>();
}
