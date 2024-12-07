import 'package:hive/hive.dart';

import '../models/todo_model.dart';

class LocalStorageService {
  static const _boxName = 'todoBox';

  // Opens the Hive box for ToDo items
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ToDoAdapter()); // Register the adapter for the model
    }
    await Hive.openBox<ToDo>(_boxName);
  }

  // Add a ToDo item
  Future<void> addTodo(ToDo todo) async {
    final box = Hive.box<ToDo>(_boxName);
    await box.put(todo.id, todo);
  }

  // Get all ToDo items
  List<ToDo> getTodos() {
    final box = Hive.box<ToDo>(_boxName);
    return box.values.toList().cast<ToDo>();
  }

  // Update a ToDo item
  Future<void> updateTodo(ToDo todo) async {
    final box = Hive.box<ToDo>(_boxName);
    await box.put(todo.id, todo);
  }

  // Delete a ToDo item
  Future<void> deleteTodo(String id) async {
    final box = Hive.box<ToDo>(_boxName);
    await box.delete(id);
  }

  // Clear all items (for testing or resetting)
  Future<void> clearAll() async {
    final box = Hive.box<ToDo>(_boxName);
    await box.clear();
  }
}