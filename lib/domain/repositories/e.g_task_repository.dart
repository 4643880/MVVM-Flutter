import 'package:mvvm_flutter_app/domain/models/e.g_task_model.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<Task> getTaskById(String id);
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(Task task);
}
