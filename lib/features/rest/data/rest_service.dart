
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_todo_app/network/dio_client.dart';

import 'models/user.dart';

final restServiceProvider = Provider((ref) => RestService(ref.watch(dioClientProvider).dio));

class RestService {
  final Dio _dio;

  RestService(this._dio);

  // Future<List<User>?> getUsers() async {
  //   try {
  //     final response = await _dio.get('/api/users');
  //     return (response.data['data'] as List).map((user) => User.fromJson(user)).toList();
  //   } catch (e) {
  //     // throw DioException.fromDioError(e);
  //     print('Error: $e');
  //     return null;
  //   }
  // }

  Future<List<User>?> getUsers(int page) async {
    try {
      final response = await _dio.get('https://reqres.in/api/users', queryParameters: {'page': 1});
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data']; // Extract the list of users
        return data.map((user) => User.fromJson(user)).toList(); // Map each JSON object to a User model
      }
      return [];
    } on DioError catch (e) {
      print('DioError: ${e.message}');
      return [];
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<User?> getUser(int id) async {
    try {
      final response = await _dio.get('https://reqres.in/api/users/$id');
      if (response.statusCode == 200) {
        final data = response.data['data']; // Access the nested 'data' object
        return User.fromJson(data);
      }
      return null;
    } on DioError catch (e) {
      print('DioError: ${e.message}');
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<User?> getUserById(int id) async {
    try {
      final response = await _dio.get('/api/users/$id');
      return User.fromJson(response.data);
    } catch (e) {
      // throw DioException.fromDioError(e);
      print('Error: $e');
      return null;
    }
  }

  Future<User?> createUser(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('/api/users', data: data);
      return User.fromJson(response.data);
    } catch (e) {
      // throw DioException.fromDioError(e);
      print('Error: $e');
      return null;
    }
  }

  Future<User?> updateUser(int id, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put('/api/users/$id', data: data);
      return User.fromJson(response.data);
    } catch (e) {
      // throw DioException.fromDioError(e);
      print('Error: $e');
      return null;
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await _dio.delete('/api/users/$id');
    } catch (e) {
      // throw DioException.fromDioError(e);
      print('Error: $e');
      return null;
    }
  }
}