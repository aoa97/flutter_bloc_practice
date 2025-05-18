part of 'todo_cubit.dart';

sealed class TodoState extends Equatable {
  final List<TaskModel> tasks;

  const TodoState(this.tasks);

  @override
  List<Object> get props => [tasks];
}

final class TodoInitial extends TodoState {
  TodoInitial() : super([]);
}

final class TodoUpdate extends TodoState {
  const TodoUpdate(super.tasks);
}
