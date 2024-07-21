import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pruebaapp/components/components.dart'; // Ajusta la importación según tu estructura

void main() {
  testWidgets('ButtonGreen renders with text and calls onPressed when tapped',
      (WidgetTester tester) async {
    // Define a callback function to test if it gets called
    bool isPressed = false;
    void onPressed() {
      isPressed = true;
    }

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonGreen(
            textButton: 'Programar reserva',
            onPressed: onPressed,
          ),
        ),
      ),
    );

    // Verify that the ButtonGreen widget renders
    expect(find.byType(ButtonGreen), findsOneWidget);
    expect(find.text('Programar reserva'), findsOneWidget);
    expect(find.byIcon(Icons.calendar_today), findsOneWidget);

    // Tap the button and verify if the onPressed callback is called
    await tester.tap(find.byType(ButtonGreen));
    await tester.pump(); // Rebuild the widget tree

    expect(isPressed, isTrue);
  });

  testWidgets(
      'ButtonGreen renders text only when textButton is not "Programar reserva"',
      (WidgetTester tester) async {
    // Define a callback function
    void onPressed() {}

    // Build the widget with a different text
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonGreen(
            textButton: 'Otro texto',
            onPressed: onPressed,
          ),
        ),
      ),
    );

    // Verify that the ButtonGreen widget renders
    expect(find.byType(ButtonGreen), findsOneWidget);
    expect(find.text('Otro texto'), findsOneWidget);
    expect(find.byIcon(Icons.calendar_today),
        findsNothing); // Icon should not be present
  });
}
