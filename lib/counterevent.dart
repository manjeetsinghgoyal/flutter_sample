import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/*

abstract class Payment{
  void pay(double amount);
}

class UpiPayment extends Payment{
  @override
  void pay(double amount){
    print("amount paid via UPI $amount");
  }
}

class CardPayment extends Payment{
  @override
  void pay(double amount){
    print("amount paid via Card $amount");
  }
}

void main(){
  Payment payment = UpiPayment();
  payment.pay(100);

  payment = CardPayment();
  payment.pay(200);
}
*/





abstract class CounterEvent {}


class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class CounterState {
  final int count;

  CounterState(this.count);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<Increment>((event, emit) => emit(CounterState(state.count + 1)));
    on<Decrement>((event, emit) => emit(CounterState(state.count - 1)));
  }
}

void main() {
  runApp(BlocProvider(create: (context) => CounterBloc(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom Error Handling Example")),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                "Counter value:- ${state.count}",
                style: TextStyle(fontSize: 15),
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "buttonIncrement",
              onPressed: () {
                context.read<CounterBloc>().add(Increment());
              },
              child: Icon(Icons.add),
            ),
            SizedBox(width: 15),
            FloatingActionButton(
              heroTag: "buttonDecrement",
              onPressed: () {
                context.read<CounterBloc>().add(Decrement());
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
