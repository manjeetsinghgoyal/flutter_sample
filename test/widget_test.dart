import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ci_demo/main.dart';

void main() {
  testWidgets('Counter increments when FAB is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Count: 0'), findsOneWidget);
    expect(find.text('Count: 1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Count: 1'), findsOneWidget);
  });
}
