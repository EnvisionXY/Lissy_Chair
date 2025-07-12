import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lissy_chair/main.dart';

void main() {
  testWidgets('App starts and shows WelcomePage', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(
        const Duration(seconds: 1)); // Warten 1 Sekunde statt auf „Fertig“

    expect(find.text('WELCOME'), findsOneWidget);
  });
}
