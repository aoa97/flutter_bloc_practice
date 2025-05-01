part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int value;
  const CounterState(this.value);
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

final class CounterUpdate extends CounterState {
  const CounterUpdate(super.value);
}
