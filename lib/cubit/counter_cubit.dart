import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() => emit(CounterUpdate(state.value + 1));
  void decrement() => emit(CounterUpdate(state.value - 1));
}
