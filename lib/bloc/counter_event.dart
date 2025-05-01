part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class CounterIncrement extends CounterEvent {}

final class CounterDecrement extends CounterEvent {}
