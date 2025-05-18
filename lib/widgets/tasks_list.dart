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

    if (tasks.isEmpty) {
      return const Center(
        child: Text(
          'No tasks yet',
          style: TextStyle(fontSize: 20),
        ),
      );
    }

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
