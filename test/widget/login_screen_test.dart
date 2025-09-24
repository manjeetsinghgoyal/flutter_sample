import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_bus_chat/screens/login_screen.dart';

void main(){

  testWidgets('Login flow with Welcome message', (tester) async{
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    await tester.enterText(find.byKey(const Key('email')), 'man@gmail.com');
    await tester.enterText(find.byKey(const Key('password')), '123456');
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.text("Welcome"), findsOneWidget);
  });

  testWidgets('Login flow with Welcome message', (tester) async{
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    await tester.enterText(find.byKey(const Key('email')), 'test@gmail.com');
    await tester.enterText(find.byKey(const Key('password')), '654321');
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.text("Invalid credentials"), findsOneWidget);
  });
}