import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/todo_model.dart';
import '../../data/services/local_storage_service.dart';
import '../../domain/repository/todo_repository.dart';

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

final todoRepositoryProvider = Provider<ToDoRepository>((ref) {
  final localStorageService = ref.read(localStorageServiceProvider);
  return ToDoRepository(localStorageService);
});

final todoListProvider = StateNotifierProvider<ToDoListNotifier, List<ToDo>>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return ToDoListNotifier(repository);
});

class ToDoListNotifier extends StateNotifier<List<ToDo>> {
  final ToDoRepository _repository;

  ToDoListNotifier(this._repository) : super([]) {
    _loadToDos();
  }

  void _loadToDos() {
    state = _repository.getTodos();
  }

  Future<void> addTodo(ToDo todo) async {
    await _repository.addTodo(todo);
    _loadToDos();
  }

  Future<void> updateTodo(ToDo todo) async {
    await _repository.updateTodo(todo);
    _loadToDos();
  }

  Future<void> deleteTodo(String id) async {
    await _repository.deleteTodo(id);
    _loadToDos();
  }
}