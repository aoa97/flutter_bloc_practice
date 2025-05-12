import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/cubit/todo_cubit.dart';

import 'widgets/task_add_input.dart';
import 'widgets/tasks_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
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
