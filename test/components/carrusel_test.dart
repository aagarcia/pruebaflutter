import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pruebaapp/components/components.dart'; // Ajusta la importación según tu estructura

void main() {
  testWidgets('Carrusel renders correctly with images and buttons',
      (WidgetTester tester) async {
    // Define a callback function for the BackButtonComponent
    // ignore: unused_local_variable
    bool backButtonPressed = false;
    void onBackPressed() {
      backButtonPressed = true;
    }

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Carrusel(
            onPressed: onBackPressed,
          ),
        ),
      ),
    );

    // Allow the carousel to complete rendering
    await tester.pumpAndSettle();

    // Verify that CarouselSlider is rendered
    expect(find.byType(CarouselSlider), findsOneWidget);

    // Verify that the BackButtonComponent is rendered
    expect(find.byType(BackButtonComponent), findsOneWidget);

    // Verify that the heart icon button is rendered
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    // Verify that the image widgets are rendered
    expect(
        find.byType(Image),
        findsNWidgets(
            3)); // Ajusta el número esperado según la cantidad de imágenes
  });
}
