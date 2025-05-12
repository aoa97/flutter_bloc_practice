part of 'tasks_bloc.dart';

sealed class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

final class TaskAddEvent extends TasksEvent {
  final String title;

  const TaskAddEvent(this.title);

  @override
  List<Object> get props => [title];
}

final class TaskDeleteEvent extends TasksEvent {
  final int id;

  const TaskDeleteEvent(this.id);

  @override
  List<Object> get props => [id];
}

final class TaskToggleEvent extends TasksEvent {
  final int id;

  const TaskToggleEvent(this.id);

  @override
  List<Object> get props => [id];
}
