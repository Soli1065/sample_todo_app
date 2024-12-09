import 'package:hive/hive.dart';

import '../models/todo_model.dart';

class LocalStorageService {
  static const _boxName = 'todoBox';

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ToDoAdapter()); // Register the adapter for the model
    }
    await Hive.openBox<ToDo>(_boxName);
  }

  Future<void> addTodo(ToDo todo) async {
    final box = Hive.box<ToDo>(_boxName);
    await box.put(todo.id, todo);
  }

  List<ToDo> getTodos() {
    final box = Hive.box<ToDo>(_boxName);
    return box.values.toList().cast<ToDo>();
  }

  Future<void> updateTodo(ToDo todo) async {
    final box = Hive.box<ToDo>(_boxName);
    await box.put(todo.id, todo);
  }

  Future<void> deleteTodo(String id) async {
    final box = Hive.box<ToDo>(_boxName);
    await box.delete(id);
  }

  Future<void> clearAll() async {
    final box = Hive.box<ToDo>(_boxName);
    await box.clear();
  }
}