import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class DetailScreen extends StatelessWidget {
  final ToDo todo;

  const DetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              todo.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            if (todo.isCompleted)
              const Text(
                'Status: Completed',
                style: TextStyle(color: Colors.green),
              )
            else
              const Text(
                'Status: Pending',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}