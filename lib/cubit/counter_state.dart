part of 'counter_cubit.dart';

@immutable
sealed class CounterState extends Equatable {
  final int value;

  const CounterState(this.value);

  @override
  List<Object> get props => [value];
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

final class CounterUpdate extends CounterState {
  const CounterUpdate(super.value);
}
