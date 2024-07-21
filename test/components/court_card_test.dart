import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pruebaapp/components/components.dart';

void main() {
  testWidgets('CourtCard displays correctly and button is functional',
      (WidgetTester tester) async {
    bool buttonPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CourtCard(
            courtName: 'Court 1',
            courtType: 'Clay',
            date: '21 de Julio 2024',
            availability: 'Disponible',
            time: '10:00 - 11:00',
            imageUrl: 'assets/p5/carrusel.png',
            progress: 80,
            onPressed: () {
              buttonPressed = true;
            },
            iconUrl: 'http://openweathermap.org/img/wn/04d@2x.png',
          ),
        ),
      ),
    );

    // Verify that the court name is displayed
    expect(find.text('Court 1'), findsOneWidget);
    // Verify that the court type is displayed
    expect(find.text('Clay'), findsOneWidget);
    // Verify that the date is displayed
    expect(find.text('21 de Julio 2024'), findsOneWidget);
    // Verify that the availability is displayed
    expect(find.text('Disponible'), findsOneWidget);
    // Verify that the time is displayed
    expect(find.text('10:00 - 11:00'), findsOneWidget);
    // Verify that the progress is displayed
    expect(find.text('80 %'), findsOneWidget);
    // Verify that the image is displayed
    expect(find.byType(Image), findsOneWidget);
    // Verify that the button is displayed
    expect(find.text('Reservar'), findsOneWidget);

    // Tap the button and verify the onPressed callback is called
    await tester.tap(find.text('Reservar'));
    await tester.pump();

    expect(buttonPressed, isTrue);
  });
}
