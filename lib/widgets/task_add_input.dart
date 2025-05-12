import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/cubit/todo_cubit.dart';

class TaskAddInput extends StatefulWidget {
  const TaskAddInput({super.key});

  @override
  State<TaskAddInput> createState() => _TaskAddInputState();
}

class _TaskAddInputState extends State<TaskAddInput> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TodoCubit>();

    submitTask() {
      if (!formKey.currentState!.validate()) {
        return;
      }
      cubit.addTask(controller.text);
      controller.clear();
    }

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          controller: controller,
          textInputAction: TextInputAction.send,
          validator: (value) => value?.isEmpty == true ? 'Please enter a valid name' : null,
          onFieldSubmitted: (_) => submitTask(),
          decoration: InputDecoration(
            hintText: 'Enter the task',
            suffixIcon: IconButton(
              onPressed: submitTask,
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
