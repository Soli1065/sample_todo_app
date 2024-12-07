import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sample_todo_app/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'data/shared_preferences_service.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register adapters if needed
  // Example: Hive.registerAdapter(TodoModelAdapter());
  Hive.registerAdapter(ToDoAdapter());

  await Hive.openBox<ToDo>('todoBox');




  final prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(
      overrides: [
        sharedPreferencesServiceProvider.overrideWithValue(SharedPreferencesService(prefs)),
      ],
      child: const MyApp()));
}