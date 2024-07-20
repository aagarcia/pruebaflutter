import 'package:flutter/material.dart';
import 'package:pruebaapp/components/components.dart';

class ReservaBody extends StatelessWidget {
  const ReservaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ButtonGreen(
                onPressed: () {},
                textButton: 'Programar reserva',
              ),
            ),
            const SizedBox(height: 30),
            const Text('Mis reservas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const ReservaCard(
              imageUrl: 'assets/p4/epic_box_cuadrado.png',
              title: 'Epic Box',
              type: 'Cancha tipo A',
              date: '9 de julio 2024',
              reservedBy: 'Andrea Gómez',
              duration: '2 horas',
              price: '\$50',
              progress: 0.3,
              userImageUrl: 'assets/p4/user.png',
            ),
            const ReservaCard(
              imageUrl: 'assets/p4/rusty_tenis_cuadrado.png',
              title: 'Rusty Tenis',
              type: 'Cancha tipo C',
              date: '10 de julio 2024',
              reservedBy: 'Andrea Gómez',
              duration: '1 hora',
              price: '\$25',
              progress: 0.6,
              userImageUrl: 'assets/p4/user.png',
            ),
            const ReservaCard(
              imageUrl: 'assets/p4/cancha_multiple_cuadrado.png',
              title: 'Cancha multiple',
              type: 'Cancha tipo B',
              date: '12 de julio 2024',
              reservedBy: 'Andrea Gómez',
              duration: '2 horas',
              price: '\$50',
              progress: 0.3,
              userImageUrl: 'assets/p4/user.png',
            ),
          ],
        ),
      ),
    );
  }
}
