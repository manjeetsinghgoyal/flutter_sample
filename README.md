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

Flutter & Dart Essentials Training Document
1. Why Flutter?
Flutter is an open-source UI toolkit created by Google for building beautiful, natively compiled, cross-platform applications for mobile, web, and desktop—all from a single codebase.
Key benefits of Flutter:
• Single Codebase: Write once, run on Android, iOS, Web, and Desktop.
• Hot Reload: Allows real-time UI and logic changes without restarting the app.
• Native Performance: Compiles to ARM code and uses Skia for rendering.
• Rich UI: Comes with Material Design and Cupertino widgets for Android & iOS.
• Strong Ecosystem: Supported by Google, growing community, and many open-source packages.
2. Flutter Architecture
Flutter has a layered architecture that provides flexibility and high performance:
• Framework Layer (Dart): Widgets, gestures, animations, rendering.
• Engine Layer (C++): Skia graphics engine, text rendering, and plugin support.
• Embedder Layer: Platform-specific APIs for Android, iOS, web, desktop.
3. Setting up Environment
Steps to set up Flutter on Windows:
1. Download Flutter SDK from https://flutter.dev.
2. Extract and add Flutter `bin` folder to PATH.
3. Install Android Studio or VS Code for IDE support.
4. Install Android SDK, configure emulator.
5. Run `flutter doctor` to verify setup.

Steps to set up Flutter on macOS (iOS development):
1. Install Xcode from App Store.
2. Install Flutter SDK and configure PATH.
3. Install CocoaPods (`sudo gem install cocoapods`).
4. Run `flutter doctor` to verify setup.
4. Basic Project Structure
Default structure:
• lib/: Dart source code, contains `main.dart`.
• android/: Android native code.
• ios/: iOS native code.
• pubspec.yaml: Manages dependencies, assets, fonts, and metadata.

Enterprise-level recommended structure:
• core/: Common utilities, constants, themes.
• data/: APIs, repositories, models.
• domain/: Business logic, use cases.
• features/: Each feature in its own module (e.g., login, dashboard, profile).
• shared/: Shared widgets, components, services.
5. Dart Essentials
Important Dart features:
• Null Safety: Prevents null reference errors. Variables must be initialized or marked nullable with '?'.
• Async & Await: Handles asynchronous programming using Futures and Streams.
• Generics: Makes code reusable and type-safe (e.g., List<int>, List<String>).
• Exception Handling: Use try-catch-finally with custom exception classes.
6. Hands-on Dart Refresher (with Solutions)
Q1: Write a program to print Fibonacci sequence using async function.
Solution:
Future<void> fibonacci(int n) async {
  int a = 0, b = 1;
  for (int i = 0; i < n; i++) {
    print(a);
    int temp = a + b;
    a = b;
    b = temp;
    await Future.delayed(Duration(milliseconds: 300));
  }
}
void main() async {
  await fibonacci(10);
}

Q2: Create a generic function to find maximum of two values.
Solution:
T maxValue<T extends Comparable>(T a, T b) {
  return (a.compareTo(b) > 0) ? a : b;
}
void main() {
  print(maxValue(10, 20));
  print(maxValue('apple', 'banana'));
}

Q3: Implement exception handling in file operations.
Solution:
import 'dart:io';

void main() {
  try {
    File file = File('data.txt');
    String contents = file.readAsStringSync();
    print(contents);
  } catch (e) {
    print('Error reading file: $e');
  } finally {
    print('Operation complete.');
  }
}
7. Flutter App Setup & Best Practices
Recommended best practices:
• Use Clean Architecture (separate UI, business logic, and data layers).
• State Management: Use Provider, Riverpod, or Bloc pattern.
• Organize project into features/modules for scalability.
• Write unit tests, widget tests, and integration tests.
• Maintain consistent naming conventions and folder structure.
• Use Dart analysis options (linter rules) for code quality.
8. Mini App Exercise: Todo App (with Solution)
Requirements:
1. Add tasks with title & description.
2. Show tasks in list with status.
3. Mark tasks completed.
4. Delete tasks.
5. Persist tasks using shared_preferences.

Solution (simplified example):
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() => runApp(TodoApp());

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Map<String, dynamic>> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  void loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('tasks');
    if (data != null) {
      setState(() {
        tasks = List<Map<String, dynamic>>.from(json.decode(data));
      });
    }
  }

  void saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('tasks', json.encode(tasks));
  }

  void addTask(String title) {
    setState(() {
      tasks.add({'title': title, 'done': false});
    });
    saveTasks();
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index]['done'] = !tasks[index]['done'];
    });
    saveTasks();
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Todo App')),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index]['title']),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteTask(index),
              ),
              leading: Checkbox(
                value: tasks[index]['done'],
                onChanged: (_) => toggleTask(index),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                TextEditingController controller = TextEditingController();
                return AlertDialog(
                  title: Text('New Task'),
                  content: TextField(controller: controller),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        addTask(controller.text);
                        Navigator.pop(context);
                      },
                      child: Text('Add'),
                    )
                  ],
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}




















Key Components of Flutter Development
1. Dart Language Fundamentals
Flutter apps are written in Dart, so knowing its core features is essential:
•	Data Types
o	int, double, String, bool, dynamic
•	Collections
o	List (like arrays), Set, Map (key-value pairs)
•	Null Safety
o	?, !, late keywords
•	Functions & Classes
o	Constructors, named parameters, optional parameters
•	Generics
o	List<String>, Map<int, String>
•	Async Programming
o	Future, async/await, Stream
•	Exception Handling
o	try–catch–finally, custom exceptions
________________________________________
2. Flutter Core Widgets
Widgets are the building blocks of a Flutter UI.
•	Basic Widgets
o	Text, Container, Row, Column, Stack, ListView
•	Material Widgets (for Android look)
o	Scaffold, AppBar, FloatingActionButton, Drawer, SnackBar
•	Cupertino Widgets (for iOS look)
o	CupertinoButton, CupertinoNavigationBar
•	Input Widgets
o	TextField, Checkbox, Radio, DropdownButton, Slider
•	Layout & Positioning
o	Expanded, Flexible, Align, Padding, Center, SizedBox
•	Advanced Lists
o	ListView.builder, GridView, CustomScrollView
________________________________________
3. State Management
To manage app state (data flow + UI updates), Flutter provides:
•	setState (basic, local state)
•	Provider (Google-recommended for medium projects)
•	Riverpod (modern, better Provider)
•	Bloc / Cubit (enterprise-level, predictable state)
•	GetX / MobX (lightweight alternatives)
________________________________________
4. Navigation & Routing
•	Navigator 1.0 (stack-based) → Navigator.push, Navigator.pop
•	Navigator 2.0 (declarative) → Good for large apps
•	Routing libraries: go_router, auto_route
________________________________________
5. Theming & Styling
•	ThemeData for global app theme
•	Custom colors, fonts, and dark mode
•	Responsive UI with MediaQuery, LayoutBuilder
________________________________________
6. Data & Persistence
•	Local Storage
o	shared_preferences (key-value store)
o	sqflite (SQLite DB)
o	hive (NoSQL DB, lightweight, fast)
•	Remote Data
o	http package (basic REST APIs)
o	dio package (advanced APIs with interceptors)
o	JSON serialization (manual / json_serializable)
________________________________________
7. Asynchronous Programming
•	Futures → async tasks (API calls, DB ops)
•	Streams → continuous data (chat, notifications, sockets)
________________________________________
8. Animations
•	Implicit animations: AnimatedContainer, AnimatedOpacity
•	Explicit animations: AnimationController, Tween, CurvedAnimation
•	Hero Animation for screen transitions
•	Lottie animations (JSON animations)
________________________________________
9. Testing
•	Unit Tests → test Dart functions
•	Widget Tests → test UI components
•	Integration Tests → test whole app flow
________________________________________
10. Dev Tools & Best Practices
•	Flutter DevTools (debugging, profiling)
•	Linting & Formatting (flutter_lints)
•	CI/CD with GitHub Actions, Codemagic, Bitrise
•	Code Splitting (modular project structure)
________________________________________
Summerize:
•	Dart → Lists, Maps, async, exceptions
•	Widgets → UI building blocks
•	State Management → Provider, Bloc, etc.
•	Navigation → Routing system
•	Data Handling → APIs + Local storage
•	Styling → Themes & responsive UI
•	Testing + Tools → For enterprise readiness


