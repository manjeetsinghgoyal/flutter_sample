import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigator Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
// first time user enter in app they splash -->onboarding--> login --> home /Register
// first time user logged splash --> is uer logged in then redirect to home screen else redirect to login screen