

import '../../data/models/todo_model.dart';
import '../../data/services/local_storage_service.dart';

class ToDoRepository {
  final LocalStorageService _localStorageService;

  ToDoRepository(this._localStorageService);

  // Initialize the storage service
  Future<void> init() => _localStorageService.init();

  // Get all ToDo items
  List<ToDo> getTodos() => _localStorageService.getTodos();

  // Add a new ToDo item
  Future<void> addTodo(ToDo todo) => _localStorageService.addTodo(todo);

  // Update an existing ToDo item
  Future<void> updateTodo(ToDo todo) => _localStorageService.updateTodo(todo);

  // Delete a ToDo item
  Future<void> deleteTodo(String id) => _localStorageService.deleteTodo(id);
}