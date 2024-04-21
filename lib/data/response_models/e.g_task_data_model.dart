import 'package:mvvm_flutter_app/domain/models/e.g_task_model.dart';

class TaskData {
  final String id;
  final String title;
  final String description;
  final String dueDate;
  final bool isCompleted;

  TaskData({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.isCompleted,
  });

  factory TaskData.fromJson(Map<String, dynamic> json) {
    return TaskData(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: json['due_date'],
      isCompleted: json['is_completed'],
    );
  }

  // Convert TaskData to Task from domain layer
  Task toDomain() {
    return Task(
      id: id,
      title: title,
      description: description,
      dueDate: DateTime.parse(dueDate),
      isCompleted: isCompleted,
    );
  }
}
