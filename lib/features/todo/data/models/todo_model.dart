import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class ToDo {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final bool isCompleted;

  @HiveField(4)
  final DateTime createdAt;

  ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
  });

  factory ToDo.create({
    required String title,
    required String description,
  }) {
    return ToDo(
      id: const Uuid().v4(),
      title: title,
      description: description,
      isCompleted: false,
      createdAt: DateTime.now(),
    );
  }

  ToDo toggleComplete() {
    return ToDo(
      id: id,
      title: title,
      description: description,
      isCompleted: !isCompleted,
      createdAt: createdAt,
    );
  }
}