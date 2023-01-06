import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/app_interceptors.dart';
import 'package:ecommerce_app/core/api/status_code.dart';
import 'package:ecommerce_app/app/injection_container.dart' as di;
import 'package:flutter/foundation.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) => status != StatusCode.internalServerError;

    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) {
    throw UnimplementedError();
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) {
    throw UnimplementedError();
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) {
    throw UnimplementedError();
  }
}
