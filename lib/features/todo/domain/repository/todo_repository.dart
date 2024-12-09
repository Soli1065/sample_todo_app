

import '../../data/models/todo_model.dart';
import '../../data/services/local_storage_service.dart';

class ToDoRepository {
  final LocalStorageService _localStorageService;

  ToDoRepository(this._localStorageService);

  Future<void> init() => _localStorageService.init();

  List<ToDo> getTodos() => _localStorageService.getTodos();

  Future<void> addTodo(ToDo todo) => _localStorageService.addTodo(todo);

  Future<void> updateTodo(ToDo todo) => _localStorageService.updateTodo(todo);

  Future<void> deleteTodo(String id) => _localStorageService.deleteTodo(id);
}