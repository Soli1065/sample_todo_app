// import 'package:dio/dio.dart';
// import 'package:todo_app/models/todo_model.dart';
//
// class FirebaseService {
//   final String _baseUrl = 'https://<your-firebase-project-id>.firebaseio.com';
//   final Dio _dio;
//
//   FirebaseService()
//       : _dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://<your-firebase-project-id>.firebaseio.com',
//       headers: {'Content-Type': 'application/json'},
//     ),
//   );
//
//   // Add a ToDo item
//   Future<void> addTodo(ToDo todo) async {
//     final endpoint = '/todos.json'; // Firebase's REST API for Realtime Database
//     await _dio.post(endpoint, data: todoToJson(todo));
//   }
//
//   // Get all ToDo items
//   Future<List<ToDo>> getTodos() async {
//     final endpoint = '/todos.json';
//     final response = await _dio.get(endpoint);
//     if (response.data != null) {
//       final data = response.data as Map<String, dynamic>;
//       return data.entries
//           .map((e) => ToDo(
//         id: e.key,
//         title: e.value['title'],
//         description: e.value['description'],
//         isCompleted: e.value['isCompleted'],
//         createdAt: DateTime.parse(e.value['createdAt']),
//       ))
//           .toList();
//     }
//     return [];
//   }
//
//   // Update a ToDo item
//   Future<void> updateTodo(ToDo todo) async {
//     final endpoint = '/todos/${todo.id}.json';
//     await _dio.patch(endpoint, data: todoToJson(todo));
//   }
//
//   // Delete a ToDo item
//   Future<void> deleteTodo(String id) async {
//     final endpoint = '/todos/$id.json';
//     await _dio.delete(endpoint);
//   }
//
//   // Helper: Serialize ToDo to JSON
//   Map<String, dynamic> todoToJson(ToDo todo) {
//     return {
//       'title': todo.title,
//       'description': todo.description,
//       'isCompleted': todo.isCompleted,
//       'createdAt': todo.createdAt.toIso8601String(),
//     };
//   }
// }