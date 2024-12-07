import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local_storage_service.dart';
import '../models/todo_model.dart';
import '../repositories/todo_repository.dart';


// LocalStorageService Provider
final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

// Repository Provider
final todoRepositoryProvider = Provider<ToDoRepository>((ref) {
  final localStorageService = ref.read(localStorageServiceProvider);
  return ToDoRepository(localStorageService);
});

// ToDo List State Provider
final todoListProvider = StateNotifierProvider<ToDoListNotifier, List<ToDo>>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return ToDoListNotifier(repository);
});

// StateNotifier for managing ToDo list
class ToDoListNotifier extends StateNotifier<List<ToDo>> {
  final ToDoRepository _repository;

  ToDoListNotifier(this._repository) : super([]) {
    _loadToDos();
  }

  // Load ToDos from repository
  void _loadToDos() {
    state = _repository.getTodos();
  }

  // Add a new ToDo
  Future<void> addTodo(ToDo todo) async {
    await _repository.addTodo(todo);
    _loadToDos();
  }

  // Update an existing ToDo
  Future<void> updateTodo(ToDo todo) async {
    await _repository.updateTodo(todo);
    _loadToDos();
  }

  // Delete a ToDo
  Future<void> deleteTodo(String id) async {
    await _repository.deleteTodo(id);
    _loadToDos();
  }
}