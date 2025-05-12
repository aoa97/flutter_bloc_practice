import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/tasks_bloc.dart';
import 'task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TasksBloc>();
    final tasks = context.select((TasksBloc cubit) => cubit.state.tasks);

    if (tasks.isEmpty) {
      return const Center(
        child: Text('No tasks'),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 24),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];

        return TaskItem(
          task: task,
          onDelete: () => bloc.add(TaskDeleteEvent(task.id)),
          onToggleCheck: () => bloc.add(TaskToggleEvent(task.id)),
        );
      },
    );
  }
}
