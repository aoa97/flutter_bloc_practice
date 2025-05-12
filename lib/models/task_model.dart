class TaskModel {
  final int id;
  final String title;
  final bool isChecked;

  TaskModel({
    required this.id,
    required this.title,
    this.isChecked = false,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    bool? isDone,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isChecked: isDone ?? isChecked,
    );
  }
}
