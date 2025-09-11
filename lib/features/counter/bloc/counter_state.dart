part of 'counter_bloc.dart';

class CounterState {
  late final int counterValue;

  CounterState(this.counterValue);

  @override
  int get hashCode => counterValue.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) ||
  other is CounterState && runtimeType == other.runtimeType && counterValue == other.counterValue;

@override
  String toString() => 'CounterState(counterValue : $counterValue)';


}
