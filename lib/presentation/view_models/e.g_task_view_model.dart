import 'package:get/get.dart';
import 'package:mvvm_flutter_app/data/response_models/e.g_task_data_model.dart';
import 'package:mvvm_flutter_app/domain/models/e.g_task_model.dart';
import 'package:mvvm_flutter_app/domain/repositories/e.g_task_repository.dart';

class TaskViewModel extends GetxController {
  final TaskRepository _taskRepository = Get.find<TaskRepository>();
  final tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      final fetchedTasks = await _taskRepository.getTasks();
      tasks.assignAll(fetchedTasks.map((taskData) => taskData));
    } catch (e) {
      // Handle error
      print('Error fetching tasks: $e');
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _taskRepository.updateTask(task);
    } catch (e) {
      // Handle error
      print('Error updating task: $e');
    }
  }
}
