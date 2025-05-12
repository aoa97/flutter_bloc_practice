import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/todo_cubit.dart';
import 'task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TodoCubit>();
    final tasks = context.select((TodoCubit cubit) => cubit.state.tasks);

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 24),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];

        return TaskItem(
          task: task,
          onDelete: () => cubit.deleteTask(task.id),
          onToggleCheck: () => cubit.toggleTask(task.id),
        );
      },
    );
  }
}
