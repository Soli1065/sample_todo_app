import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_todo_app/core/theme/theme_data.dart';
import 'package:sample_todo_app/core/theme/theme_notifier.dart';
import 'package:sample_todo_app/features/home/home_screen.dart';


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeRef = ref.watch(themeNotifierProvider);
    return MaterialApp(
      title: 'My Sample App',
      themeMode: themeRef,
      darkTheme: themeDataDark,
      theme: themeData,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}