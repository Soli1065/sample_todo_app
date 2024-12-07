import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_todo_app/features/graphql/presentation/graphql_screen.dart';
import 'package:sample_todo_app/features/rest/presentation/rest_screen.dart';
import 'package:sample_todo_app/features/settings/presentation/settings_screen.dart';

import '../todo/presentation/todo_screen.dart';


final tabIndexProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get current tab index
    final tabIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Sample App'),
      ),
      body: IndexedStack(
        index: tabIndex,
        children: const [
          TodoScreen(),
          RestScreen(),
          GraphqlScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (index) {
          ref.read(tabIndexProvider.notifier).update((state) => index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.http),
            label: 'REST',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: 'GraphQL',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}