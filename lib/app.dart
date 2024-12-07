import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_todo_app/core/theme/theme_notifier.dart';

import 'features/todo/presentation/todo_screen.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeRef = ref.watch(themeNotifierProvider);
    return MaterialApp(
      title: 'ToDo App',
      themeMode: themeRef,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const TodoScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}