import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Log the error
    print('--- Error Interceptor ---');
    print('URL: ${err.requestOptions.baseUrl}${err.requestOptions.path}');
    print('Status Code: ${err.response?.statusCode}');
    print('Message: ${err.message}');
    if (err.response?.data != null) {
      print('Error Body: ${err.response?.data}');
    }

    String errorMessage = _handleError(err);

    final updatedError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      message: errorMessage,
      error: err.error,
    );

    print('Modified Error Message: $errorMessage');
    print('------------------------');

    handler.next(updatedError);
  }

  String _handleError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout) {
      return 'Connection timeout. Please try again later.';
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return 'Server response timeout. Please try again.';
    } else if (error.type == DioExceptionType.sendTimeout) {
      return 'Request send timeout. Please check your connection.';
    } else if (error.response != null) {
      switch (error.response?.statusCode) {
        case 400:
          return 'Bad request. Please check your input.';
        case 401:
          return 'Unauthorized. Please login again.';
        case 403:
          return 'Forbidden. You do not have access.';
        case 404:
          return 'Not found. Please check the URL.';
        case 500:
          return 'Internal server error. Please try again later.';
        default:
          return 'Something went wrong. Please try again.';
      }
    } else {
      return 'Unexpected error occurred. Please try again.';
    }
  }
}