import 'package:http/http.dart' as http;
import 'package:mvvm_flutter_app/data/response_models/e.g_task_data_model.dart';
import 'package:mvvm_flutter_app/domain/models/e.g_task_model.dart';
import 'dart:convert';

import 'package:mvvm_flutter_app/domain/repositories/e.g_task_repository.dart';

class ApiTaskRepository implements TaskRepository {
  final String apiUrl;

  ApiTaskRepository(this.apiUrl);

  @override
  Future<List<Task>> getTasks() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData
          .map((taskJson) => TaskData.fromJson(taskJson).toDomain())
          .toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  @override
  Future<Task> getTaskById(String id) {
    // Implement method to fetch task by ID
    throw UnimplementedError();
  }

  @override
  Future<void> addTask(Task task) {
    // Implement method to add a new task
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(Task task) {
    // Implement method to update an existing task
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(Task task) {
    // Implement method to delete a task
    throw UnimplementedError();
  }
}
