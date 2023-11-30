import 'package:counter/counter_cubit/counter_cubit.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit/counter_event.dart';

void main(List<String> args) {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  CounterApp({super.key});

  List names = [
    'Jasur',
    'Akbarali',
    'Muhammadamin',
    'Muhammadrasul',
    'Muhammadziyo',
    'Muhammadsaid',
    'Fotima',
    'Aziza',
    'Gulrux',
    'Feruzbek',
    'Axmadxon',
    'Mahmudxon',
    'Hojiakbar',
    'Ozodbek',
    'Bahodir',
    'Sohibjon',
    'Mehrojiddin',
    'Sardor',
    'Dovudxon',
    'Jahongir',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("Counter"),
                  backgroundColor: Colors.blue,
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${names[state]}"),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            if (state > 0) {
                              context
                                  .read<CounterBloc>()
                                  .add(PressButtonPrevEvent());
                            }
                          },
                          child: const Icon(Icons.navigate_before),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (names.length > state + 1) {
                              context
                                  .read<CounterBloc>()
                                  .add(PressButtonNextEvent());
                            }
                          },
                          child: const Icon(Icons.navigate_next),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
