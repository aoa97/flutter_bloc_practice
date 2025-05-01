import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Builder(
              builder: (_) => Text(
                context.watch<CounterBloc>().state.value.toString(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Wrap(
              spacing: 10,
              children: [
                FilledButton.tonal(
                  onPressed: () => bloc.add(CounterDecrement()),
                  child: const Text("Decrement"),
                ),
                FilledButton(
                  onPressed: () => bloc.add(CounterIncrement()),
                  child: const Text("Increment"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
