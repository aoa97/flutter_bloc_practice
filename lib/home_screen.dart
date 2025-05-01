import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/cubit/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) => Text(
                cubit.state.toString(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Wrap(
              spacing: 10,
              children: [
                FilledButton.tonal(
                  onPressed: cubit.decrement,
                  child: const Text("Decrement"),
                ),
                FilledButton(
                  onPressed: cubit.increment,
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
