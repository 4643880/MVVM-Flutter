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
}
