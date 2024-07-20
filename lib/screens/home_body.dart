import 'package:flutter/material.dart';
import 'package:pruebaapp/components/components.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hola Andrea!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Divider(color: Color(0xFFD4E2F3), thickness: 1),
            const SizedBox(height: 14),
            const Text(
              'Canchas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 342,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CourtCard(
                    courtName: 'Epic Box',
                    courtType: 'Cancha tipo A',
                    date: '9 de julio 2024',
                    availability: 'Disponible',
                    time: '7:00 am a 4:00 pm',
                    imageUrl: 'assets/p4/cancha_multiple_rectangulo.png',
                    progress: 30,
                  ),
                  CourtCard(
                    courtName: 'Sport Zone',
                    courtType: 'Cancha tipo B',
                    date: '10 de julio 2024',
                    availability: 'No disponible',
                    time: '',
                    imageUrl: 'assets/p4/epic_box_rectangulo.png',
                    progress: 60,
                  ),
                  CourtCard(
                    courtName: 'Sport Zone',
                    courtType: 'Cancha tipo C',
                    date: '10 de julio 2024',
                    availability: 'Disponible',
                    time: '7:00 am a 4:00 pm',
                    imageUrl: 'assets/p4/rusty_tenis_rectangulo.png',
                    progress: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(color: Color(0xFFD4E2F3), thickness: 1),
            const SizedBox(height: 16),
            const Text(
              'Reservas programadas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const ReservationCard(
              courtName: 'Epic Box',
              date: '6 de julio 2024',
              user: 'Andrea Gómez',
              duration: '2 horas',
              price: '\$50',
              imageUrl: 'assets/p4/epic_box_cuadrado.png',
              userImageUrl: 'assets/p4/user.png',
            ),
            const ReservationCard(
              courtName: 'Cancha Multiple',
              date: '7 de julio 2024',
              user: 'Andrea Gómez',
              duration: '2 horas',
              price: '\$50',
              imageUrl: 'assets/p4/cancha_multiple_cuadrado.png',
              userImageUrl: 'assets/p4/user.png',
            ),
            const ReservationCard(
              courtName: 'Rusty Tenis',
              date: '7 de julio 2024',
              user: 'Andrea Gómez',
              duration: '2 horas',
              price: '\$50',
              imageUrl: 'assets/p4/rusty_tenis_cuadrado.png',
              userImageUrl: 'assets/p4/user.png',
            ),
            const ReservationCard(
              courtName: 'Rusty Tenis',
              date: '7 de julio 2024',
              user: 'Andrea Gómez',
              duration: '2 horas',
              price: '\$50',
              imageUrl: 'assets/p4/rusty_tenis_cuadrado.png',
              userImageUrl: 'assets/p4/user.png',
            ),
          ],
        ),
      ),
    );
  }
}
