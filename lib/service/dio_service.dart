import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_service.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio =
      Dio(BaseOptions(baseUrl: "http://localhost:8000", contentType: "application/json", headers: {
    "Allow-Control-Allow-Origin": "*",
  }));

  dio.interceptors.add(AwesomeDioInterceptor(
      logRequestTimeout: false,
      logResponseHeaders: false,
      logRequestHeaders: true,
      logger: debugPrint));

  return dio;
}
