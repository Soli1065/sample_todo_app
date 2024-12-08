import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/todo_model.dart';
import 'add_edit_screen.dart';
import 'provider/todo_provider.dart';
import 'widgets/todo_tile.dart';


class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);

    return Scaffold(
      body: todoList.isEmpty
          ? const Center(
        child: Text('No ToDos available! Add one now.'),
      )
          : ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final todo = todoList[index];
          return ToDoTile(
            todo: todo,
            onTap: () => _navigateToAddEdit(context, todo),
            onDelete: () => _deleteToDo(ref, todo.id),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddEdit(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToAddEdit(BuildContext context, ToDo? todo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditScreen(todo: todo),
      ),
    );
  }

  void _deleteToDo(WidgetRef ref, String id) async {
    await ref.read(todoListProvider.notifier).deleteTodo(id);
  }
}