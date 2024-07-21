import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pruebaapp/components/components.dart'; // Ajusta la importación según tu estructura

void main() {
  testWidgets('BackButtonComponent renders correctly', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              BackButtonComponent(
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );

    // Verify that the BackButtonComponent is rendered
    expect(find.byType(BackButtonComponent), findsOneWidget);

    // Verify the IconButton is inside the BackButtonComponent
    expect(find.byType(IconButton), findsOneWidget);
    // Verify the IconButton has the correct icon
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });
}
