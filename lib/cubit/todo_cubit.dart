import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practice/models/task_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  addTask(String title) {
    final newTask = TaskModel(
      id: DateTime.now().millisecond,
      title: title,
    );
    emit(TodoUpdate([...state.tasks, newTask]));
  }

  deleteTask(int id) {
    final updatedTasks = state.tasks.where((task) => task.id != id).toList();
    emit(TodoUpdate(updatedTasks));
  }

  toggleTask(int id) {
    final updatedTasks = [
      ...state.tasks.map((task) => task.id == id ? task.copyWith(isDone: !task.isChecked) : task)
    ];
    emit(TodoUpdate(updatedTasks));
  }
}
