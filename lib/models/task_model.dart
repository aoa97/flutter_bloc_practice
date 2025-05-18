class TaskModel {
  final int id;
  final String title;
  final bool isChecked;

  TaskModel({
    required this.id,
    required this.title,
    this.isChecked = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isChecked': isChecked,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      isChecked: json['isChecked'],
    );
  }

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
