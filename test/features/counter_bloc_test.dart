import 'package:bloc_test/bloc_test.dart';
import 'package:chat/features/counter/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    blocTest<CounterBloc, CounterState>(
      'emit [CounterState(1)] when increment is added',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(Increment()),
      expect: () => [CounterState(1)],
    );

    blocTest<CounterBloc, CounterState>(
      'emit [CounterState(-1)] when decrement is added',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(Decrement()),
      expect: () => [CounterState(-1)],
    );
  });
}
