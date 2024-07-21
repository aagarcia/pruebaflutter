import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pruebaapp/components/components.dart'; // Ajusta la importación según tu estructura

void main() {
  testWidgets(
      'CardProgress shows CircularProgressIndicator when textIndicator is empty',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CardProgress(
            textIndicator: '',
          ),
        ),
      ),
    );

    // Verify that the CircularProgressIndicator is displayed
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text(''), findsNothing); // Ensure no text is displayed
  });

  testWidgets('CardProgress shows text when textIndicator is not empty',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CardProgress(
            textIndicator: 'Loading...',
          ),
        ),
      ),
    );

    // Verify that the Text widget is displayed with the correct text
    expect(find.byType(Text), findsOneWidget);
    expect(find.text('Loading...'), findsOneWidget);
    // Verify the text style
    final textWidget = tester.widget<Text>(find.byType(Text));
    expect(textWidget.style?.fontWeight, FontWeight.bold);
    expect(textWidget.style?.fontSize, 20.0);
  });
}
