import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onDelete;
  final VoidCallback onToggleCheck;

  const TaskItem({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onToggleCheck,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      leading: Checkbox(
        value: task.isChecked,
        onChanged: (_) => onToggleCheck(),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        color: Theme.of(context).colorScheme.error,
        onPressed: onDelete,
      ),
    );
  }
}
