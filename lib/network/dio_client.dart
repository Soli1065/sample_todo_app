import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'interceptors/error_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'network_config.dart';


final dioClientProvider = Provider((ref) => DioClient());

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio _dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: NetworkConfig.baseUrl,
      connectTimeout: const Duration(milliseconds: NetworkConfig.connectTimeout),
      receiveTimeout: const Duration(milliseconds: NetworkConfig.receiveTimeout),
      headers: NetworkConfig.defaultHeaders,
    ));

    _dio.interceptors.addAll([
      LoggingInterceptor(),
      ErrorInterceptor(),
    ]);
  }

  Dio get dio => _dio;

  Dio buildDio({
    required String baseUrl,
    Map<String, dynamic>? headers,
    int? connectTimeout,
    int? receiveTimeout,
  }) {
    return Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: connectTimeout ?? NetworkConfig.connectTimeout),
      receiveTimeout: Duration(milliseconds: receiveTimeout ?? NetworkConfig.receiveTimeout),
      headers: headers ?? NetworkConfig.defaultHeaders,
    ));
  }
}