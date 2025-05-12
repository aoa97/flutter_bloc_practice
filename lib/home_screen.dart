import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/tasks_bloc.dart';
import 'widgets/task_add_input.dart';
import 'widgets/tasks_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ToDo'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(45),
            child: TaskAddInput(),
          ),
        ),
        body: TasksList(),
      ),
    );
  }
}
