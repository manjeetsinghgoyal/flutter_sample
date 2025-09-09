# chat

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
Flutter Syntax Guide for Freshers
1. Dart Basics
Variables:
•  String? email → means email can be null.
•  ?. (null-aware access operator) → safely checks before accessing.
•  ?? (null-coalescing operator) → provides a default value.
name??=”Manjeet”
var name = "John";        // Type is inferred
name = “25”; 
dynamic name =”Jhon”
name = 35;
String city = "London";   // Explicit type
int age = 25;             // Integer
double pi = 3.14;         // Decimal
bool isActive = true;     // Boolean

Functions:
Returntype functionname(argument….n){
}

void greet(String? name) {
name??=”Manjeet”;

  print("Hello, $name");
}

int add(int a, int b) { a=2, b=3
  return a + b;
}

void main() {
  greet(null); greet(“Raj”);
  print(add(5, 3));
}

2. Flutter App Structure

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: Text("Hello Flutter")),
        body: Center(child: Text("Welcome to Flutter!")),
      ),
    );
  }
}

3. Widgets
StatelessWidget Example:

class MyTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("I never change!");
  }
}

StatefulWidget Example:

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;

  void increment() {
    setState(() {
      count++;  // UI updates here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(child: Text("Count: $count")),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: Icon(Icons.add),
      ),
    );
  }
}

4. Common Widgets
Widget	Purpose	Example
Text	Display text	Text("Hello")
Container	Box with padding, margin, color	Container(color: Colors.red, width: 100, height: 100)
Column	Arrange vertically	Column(children: [Text("A"), Text("B")])
Row	Arrange horizontally	Row(children: [Icon(Icons.star), Text("Star")])
Scaffold	Basic page structure	Scaffold(appBar: AppBar(...), body: ...)
ListView	Scrollable list	ListView(children: [...])



Image	Show images	Image.network("url")
5. Navigation (Moving between screens)

Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondPage()),
);
//Login ->Registration
//Login home page
//A->B->C->D
//A->C->D
//A->D
//Go back:

6. Hot Reload & Hot Restart

- Hot Reload → Instantly updates UI when you save code.
- Hot Restart → Restarts app but keeps code changes.
ctrl + \ hot reload
Shift





name?.length()
