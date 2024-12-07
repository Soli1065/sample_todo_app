import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class ToDoTile extends StatelessWidget {
  final ToDo todo;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const ToDoTile({
    super.key,
    required this.todo,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration:
          todo.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(todo.description),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
      onTap: onTap,
    );
  }
}