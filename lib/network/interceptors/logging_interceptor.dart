import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('--- Request ---');
    print('URL: ${options.baseUrl}${options.path}');
    print('Method: ${options.method}');
    print('Headers: ${options.headers}');
    print('Query Parameters: ${options.queryParameters}');
    if (options.data != null) {
      print('Body: ${options.data}');
    }
    print('----------------');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('--- Response ---');
    print('URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    print('Status Code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    if (response.data != null) {
      print('Body: ${response.data}');
    }
    print('----------------');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('--- Error ---');
    print('URL: ${err.requestOptions.baseUrl}${err.requestOptions.path}');
    print('Message: ${err.message}');
    if (err.response != null) {
      print('Status Code: ${err.response?.statusCode}');
      print('Headers: ${err.response?.headers}');
      print('Body: ${err.response?.data}');
    }
    print('----------------');
    super.onError(err, handler);
  }
}