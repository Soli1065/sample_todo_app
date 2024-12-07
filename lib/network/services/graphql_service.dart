import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_todo_app/network/core/dio_client.dart';

final graphqlServiceProvider = Provider((ref) => GraphQLService(ref.watch(dioClientProvider).dio));

class GraphQLService {
  final Dio _dio;

  GraphQLService(this._dio);

  Future<Response> query(String endpoint, {dynamic data}) async {
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

  Future<Response> mutate(String endpoint, {dynamic data}) async {
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

  void _handleDioException(DioException e) {
    // You can log the exception, show a user-friendly error message, or handle it in any other way that fits your application
    print('DioException caught: ${e.message}');
    // Additional handling based on e.type, e.response, etc.
  }
}