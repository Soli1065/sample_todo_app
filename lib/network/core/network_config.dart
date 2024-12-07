class NetworkConfig {
  // Base URL for the API
  static const String baseUrl = 'https://api.example.com';

  // Timeout durations in milliseconds
  static const int connectTimeout = 15000; // 15 seconds
  static const int receiveTimeout = 15000; // 15 seconds

  // Default headers for all requests
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}