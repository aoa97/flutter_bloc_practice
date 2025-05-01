import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrement>(_increment);
    on<CounterDecrement>(_decrement);
  }

  FutureOr<void> _increment(CounterIncrement event, Emitter<CounterState> emit) {
    emit(CounterUpdate(state.value + 1));
  }

  FutureOr<void> _decrement(CounterDecrement event, Emitter<CounterState> emit) {
    emit(CounterUpdate(state.value - 1));
  }
}
