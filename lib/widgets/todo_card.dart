import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class ToDoCard extends StatelessWidget {
  final ToDo todo;
  final VoidCallback onTap;

  const ToDoCard({super.key, required this.todo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          todo.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(todo.description),
        trailing: Icon(
          todo.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: todo.isCompleted ? Colors.green : Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}