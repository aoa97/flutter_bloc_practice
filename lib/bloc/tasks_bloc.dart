import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/task_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitial()) {
    on<TaskAddEvent>(handleAdd);

    on<TaskDeleteEvent>(handleRemove);

    on<TaskToggleEvent>(handleToggle);
  }

  FutureOr<void> handleAdd(TaskAddEvent event, Emitter<TasksState> emit) {
    final newTask = TaskModel(
      id: DateTime.now().millisecond,
      title: event.title,
    );
    emit(TasksUpdate([...state.tasks, newTask]));
  }

  FutureOr<void> handleRemove(TaskDeleteEvent event, Emitter<TasksState> emit) {
    final updatedTasks = state.tasks.where((task) => task.id != event.id).toList();
    emit(TasksUpdate(updatedTasks));
  }

  FutureOr<void> handleToggle(TaskToggleEvent event, Emitter<TasksState> emit) {
    final updatedTasks = [
      ...state.tasks.map((task) => task.id == event.id ? task.copyWith(isDone: !task.isChecked) : task)
    ];
    emit(TasksUpdate(updatedTasks));
  }
}
