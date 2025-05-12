part of 'tasks_bloc.dart';

sealed class TasksState extends Equatable {
  final List<TaskModel> tasks;

  const TasksState(this.tasks);

  @override
  List<Object> get props => [tasks];
}

final class TasksInitial extends TasksState {
  TasksInitial()
      : super(
          [
            TaskModel(
              id: 1,
              title: 'Task 1',
            ),
            TaskModel(
              id: 2,
              title: 'Task 2',
            ),
          ],
        );
}

final class TasksUpdate extends TasksState {
  const TasksUpdate(super.tasks);
}
