import 'package:counter/counter_cubit/counter_cubit.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        home: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Counter"),
              ),
              body: Center(child: Text("$state")),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                child: const Icon(Icons.add),
              ),
            );
          },
        ),
      ),
    );
  }
}
