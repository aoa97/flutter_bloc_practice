import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practice/models/task_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'todo_state.dart';

/* 
  hydrated_bloc:
    - Helps to persist & restore bloc and cubit states.
    - Built on top of hive
*/

class TodoCubit extends HydratedCubit<TodoState> {
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

  // Restore the last saved state (On cubit initialization)
  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoUpdate(
      List<TaskModel>.from((json['tasks'] as List).map((task) => TaskModel.fromJson(task))),
    );
  }

  // Save the current state to storage (Everytime the state changes)
  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return {
      'tasks': [...state.tasks.map((task) => task.toJson())],
    };
  }
}
