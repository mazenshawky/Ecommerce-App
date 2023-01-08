import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/app_interceptors.dart';
import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/modules/products/data/datasource/products_remote_data_source.dart';
import 'package:ecommerce_app/modules/products/data/repository/products_repository_impl.dart';
import 'package:ecommerce_app/modules/products/domain/repository/products_repository.dart';
import 'package:ecommerce_app/modules/products/domain/usecases/get_all_products_usecase.dart';
import 'package:ecommerce_app/modules/products/domain/usecases/get_cart_usecase.dart';
import 'package:ecommerce_app/modules/products/domain/usecases/get_product_details_usecase.dart';
import 'package:ecommerce_app/modules/products/presentation/cubit/cart/cart_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modules/localization/data/datasources/lang_local_data_source.dart';
import '../modules/localization/data/repositories/lang_repository_impl.dart';
import '../modules/localization/domain/repositories/lang_repository.dart';
import '../modules/localization/domain/usecases/change_lang.dart';
import '../modules/localization/domain/usecases/get_saved_lang.dart';
import '../modules/localization/presentation/cubit/locale_cubit.dart';
import '../modules/products/presentation/cubit/product_details/product_details_cubit.dart';
import '../modules/products/presentation/cubit/products/products_cubit.dart';
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
  sl.registerFactory<CartCubit>(() => CartCubit(getCartUseCase: sl()));
  sl.registerFactory<ProductDetailsCubit>(
      () => ProductDetailsCubit(getProductDetailsUseCase: sl()));
  sl.registerFactory<LocaleCubit>(
      () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  // Use Cases
  sl.registerLazySingleton<GetAllProductsUseCase>(
      () => GetAllProductsUseCase(baseProductsRepository: sl()));
  sl.registerLazySingleton<GetCartUseCase>(
      () => GetCartUseCase(baseProductsRepository: sl()));
  sl.registerLazySingleton<GetProductDetailsUseCase>(
      () => GetProductDetailsUseCase(baseProductsRepository: sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(
      () => ChangeLangUseCase(langRepository: sl()));

  // Repositories
  sl.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(
        networkInfo: sl(),
        productsRemoteDataSource: sl(),
      ));
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(langLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<LangLocalDataSource>(
      () => LangLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
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
