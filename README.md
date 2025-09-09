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


For Day 5 notes
Code Reusability & Dependency Injection in Flutter
1. Code Reusability in Flutter
A. Custom Widgets
• In Flutter, everything is a widget.
• Code reusability is achieved by breaking large UIs into reusable custom widgets.
• Benefits: Encapsulation, Clean Code, Easy Maintainability.

Example:
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const CustomButton({required this.label, required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
B. Mixins
• Used to reuse logic across multiple classes.
• Common use cases: Logging, Analytics, Validation logic.





Example:

mixin Logger {
  void log(String msg) {
    print("[LOG] $msg");
  }
}
mixin ProdLogger{
  void prodlog(String msg) {
   print("Hi");
  }
}


class ApiService with Logger , ProdLogger{}

  void main() {
var apiService = ApiService();
apiService. Log

    log("Fetching data from API...");
  }
}
Class User with Logger{
String name;
User(this.name);
Void showUserName(){
 Log(“the name of user is $name);
}
C. Extensions
• Add methods/properties to existing classes without modifying them.
• Useful for utilities like String/Date/Number formatting.

Example:
extension StringExtensions on String {
  bool get isValidEmail =>
      RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$").hasMatch(this);

  String get capitalize =>
      this.isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;
}
2. extension StringExtensions on String {
  bool get isPalindrome {
String reversed = split(“”).reversed.join(‘’);
Return this == reversed;
}
void main(){
String word =”madam”;
Print(word.isPalindrome);
}
3. extension NumberExtensions on int{
int get squared => this*this;
}
void main(){
Print(5.squared());
}






4.
 extension DateFormatting on DateTime{
String get formatterd => “${day.toString().padLeft(2,’0’)}-
${month.toString().padLeft(2,’0’)}-
${year}”;

void main(){
DateTime now = DateTime.now();
Print(now. Formatterd);//08-09-2025
}

2. Dependency Injection in Flutter
A. What is Dependency Injection?
• A design pattern to make code loosely coupled.
• Inject dependencies instead of creating them inside a class.
• Benefits: Testability, Maintainability, Separation of concerns.









B. Manual Dependency Injection
Example:
class ApiService {
  String getData() => "API Data";
Void fetchData() => print(“Data fetched from Api”);
}

* class Repository {
  final ApiService api; //loosely coupled
  Repository(this.api);

  String fetch() => api.getData();
}
*Class UserRepository{
Final ApiService apiService = ApiService(); //tightly coupled 
Void getUser(){
apiService.fetchData();
}}
Void main(){
Var repo = USerRepository();
Repo.getUser();}




C. Using Provider for DI
• Provider is a Flutter package widely used for state management and dependency injection.

Example:
MultiProvider(
  providers: [
    Provider(create: (_) => ApiService()),
    ProxyProvider<ApiService, Repository>(
      update: (_, api, __) => Repository(api),
    ),
  ],
  child: MyApp(),
);
D. Using get_it (Service Locator)
• get_it is a simple service locator for DI in Flutter.

Example:
final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
}

void main() {
  setup();
  runApp(MyApp());
}
3. Summary (2-Hour Flow)
1. Custom Widgets → 30 min
2. Mixins → 15 min
3. Extensions → 15 min
4. DI Theory + Manual DI → 25 min
5. Provider DI → 20 min
6. get_it DI → 15 min

4. Writing Maintainable Code in Flutter
• Maintainable code is clean, readable, testable, and scalable.
• Best practices include:
  - Use meaningful names for variables, classes, and functions.
  - Break down large widgets into smaller reusable widgets.
  - Follow DRY (Don’t Repeat Yourself) principle.
  - Organize code into layers (UI, business logic, data).
  - Use comments and documentation where necessary.

5. SOLID Principles in Flutter
• SOLID is a set of 5 principles for writing clean and maintainable code:

1. **S - Single Responsibility Principle** → Each class should have one reason to change.
   Example: Separate API handling and UI rendering into different classes.

2. **O - Open/Closed Principle** → Classes should be open for extension but closed for modification.
   Example: Use abstract classes/interfaces and extend them for new features.

3. **L - Liskov Substitution Principle** → Subclasses should be replaceable by their base classes.
   Example: A custom ButtonWidget should be usable anywhere a basic Widget is expected.

4. **I - Interface Segregation Principle** → Prefer many small interfaces over a single large one.
   Example: Create separate interfaces for Fetchable, Cacheable instead of one giant interface.

5. **D - Dependency Inversion Principle** → Depend on abstractions, not concrete implementations.
   Example: Use Repository interface, inject implementation (API or Mock).

6. Naming Conventions in Flutter
• Naming conventions improve readability and maintainability.
• Flutter/Dart naming best practices:
  - Classes, enums, typedefs: **PascalCase** (e.g., HomeScreen, ApiService).
  - Variables, functions, parameters: **camelCase** (e.g., fetchData, userName).
  - Constants: **lowerCamelCase** (e.g., defaultPadding).
  - Files and directories: **snake_case** (e.g., home_screen.dart).
  - Widget suffix: Add 'Widget' or descriptive suffix (e.g., LoginFormWidget).
  - Avoid abbreviations unless well-known (use `database` instead of `db`).

======================================================
For Day 6 

BLoC in Flutter
1 – Introduction & Core Concepts
Why State Management?
- setState() → good for small apps, messy in large projects
- Problems:
  • UI tightly coupled with business logic
  • Hard to scale & test
  • Duplicate logic across screens
What is BLoC?
BLoC = Business Logic Component
Separates business logic from UI
Flow: UI → Event → BLoC → State → UI
Core Concepts
- Event → 'What happened?' (button click, user input)
- State → 'What UI should look like now?'
- BLoC → Maps events to states
Demo: Counter with Cubit

1. class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
2.   void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}






Demo: Counter with Bloc (Event + State)

1. abstract class CounterEvent {}
2. class Increment extends CounterEvent {}
class Decrement extends CounterEvent {}

class CounterState{
final int count;
CounterState(this.count);}



3. class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState (0)) {
    on<Increment>((event, emit) => emit(CounterState(state + 1)));
    on<Decrement>((event, emit) => emit(CounterState(state - 1)));
  }
}

2 – Deep Dive with Examples
Events & States in Real Life: Login Flow
Event: LoginSubmitted(email, password)
States: LoginInitial, LoginLoading, LoginSuccess, LoginFailure
Demo: Login with BLoC

class LoginSubmitted extends LoginEvent {
  final String email, password;
  LoginSubmitted(this.email, this.password);
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 2)); // fake API
      if (event.email == "test@test.com" && event.password == "1234") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Invalid credentials"));
      }
    });
  }
}

3 – Advanced & Hands-On
Cubit vs BLoC
- Use Cubit for: toggle theme, counter, tabs, small states
- Use Bloc for: login, checkout, todo, chat, complex flows
Best Practices
- Keep business logic in BLoC, not UI
- Don’t create giant 'God Blocs' → break into smaller ones
- Use BlocProvider, BlocBuilder, BlocListener wisely
- Write tests for BLoC (state expectations)
Demo: Todo App with BLoC

class AddTodo extends TodoEvent { final String task; AddTodo(this.task); }
class RemoveTodo extends TodoEvent { final int index; RemoveTodo(this.index); }

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState([])) {
    on<AddTodo>((event, emit) => emit(TodoState([...state.todos, event.task])));
    on<RemoveTodo>((event, emit) {
      final newList = List<String>.from(state.todos)..removeAt(event.index);
      emit(TodoState(newList));
    });
  }
}

Wrap-up
✅ We Learned:
- Why BLoC is needed
- Events, States, BLoC flow
- Difference: Cubit vs BLoC
- Real apps: Counter, Login, Todo
- Best practices for production
Resources
- https://bloclibrary.dev
- https://pub.dev/packages/flutter_bloc
- GitHub examples: flutter_bloc repo
