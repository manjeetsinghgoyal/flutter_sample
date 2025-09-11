import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext buildContext) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter Example"),
        ),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (buildContext, state) {
              return Text("counter value is: ${state.counterValue}",
                  style: const TextStyle(fontSize: 15));
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "increment",
              onPressed: () =>
                  buildContext.read<CounterBloc>().add(Increment()),
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 15.0),
            FloatingActionButton(
              heroTag: "increment",
              onPressed: () =>
                  buildContext.read<CounterBloc>().add(Increment()),
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}