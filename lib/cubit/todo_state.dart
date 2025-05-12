part of 'todo_cubit.dart';

sealed class TodoState extends Equatable {
  final List<TaskModel> tasks;

  const TodoState(this.tasks);

  @override
  List<Object> get props => [tasks];
}

final class TodoInitial extends TodoState {
  TodoInitial()
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

final class TodoUpdate extends TodoState {
  const TodoUpdate(super.tasks);
}
