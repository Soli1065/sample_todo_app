import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_todo_app/network/core/dio_client.dart';

final restServiceProvider = Provider((ref) => RestService(ref.watch(dioClientProvider).dio));

class RestService {
  final Dio _dio;

  RestService(this._dio);

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      // Handle DioException
      _handleDioException(e);
    }
    return Future.error('An error occurred'); // Ensure non-null return
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      // Handle DioException
      _handleDioException(e);
    }
    return Future.error('An error occurred'); // Ensure non-null return
  }

  Future<Response> put(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      // Handle DioException
      _handleDioException(e);
    }
    return Future.error('An error occurred'); // Ensure non-null return
  }

  Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      // Handle DioException
      _handleDioException(e);
    }
    return Future.error('An error occurred'); // Ensure non-null return
  }

  void _handleDioException(DioException e) {
    // You can log the exception, show a user-friendly error message, or handle it in any other way that fits your application
    print('DioException caught: ${e.message}');
    // Additional handling based on e.type, e.response, etc.
  }
}