class NetworkConfig {

  static const String baseUrl = 'https://reqres.in';

  static const int connectTimeout = 15000;
  static const int receiveTimeout = 15000;

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}