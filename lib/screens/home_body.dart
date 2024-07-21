import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pruebaapp/components/components.dart';
import 'package:pruebaapp/controllers/controllers.dart';
import 'package:pruebaapp/models/models.dart';
import 'package:pruebaapp/util/funciones_varias.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    CanchaController canchaController =
        Provider.of<CanchaController>(context, listen: false);

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
              child: FutureBuilder<List<Cancha>>(
                future: canchaController.obtenerCanchas(),
                builder: (conext, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    List<Widget> cards = [
                      const CardProgress(textIndicator: ''),
                      const CardProgress(textIndicator: ''),
                      const CardProgress(textIndicator: ''),
                    ];

                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: cards,
                    );
                  } else if (snapshot.hasError) {
                    List<Widget> cards = [
                      CardProgress(textIndicator: 'Error: ${snapshot.error}'),
                      CardProgress(textIndicator: 'Error: ${snapshot.error}'),
                      CardProgress(textIndicator: 'Error: ${snapshot.error}'),
                    ];

                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: cards,
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    List<Widget> cards = [
                      const CardProgress(
                          textIndicator: 'No hay instructores disponibles'),
                      const CardProgress(
                          textIndicator: 'No hay instructores disponibles'),
                      const CardProgress(
                          textIndicator: 'No hay instructores disponibles'),
                    ];

                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: cards,
                    );
                  } else {
                    List<Widget> cards = [];
                    for (Cancha cancha in snapshot.data!) {
                      cards.add(CourtCard(
                        courtName: cancha.nombre,
                        courtType: cancha.tipo,
                        date: FuncionesVarias.getFormattedDate(),
                        availability: cancha.disponibilidad,
                        time: '${cancha.horaIni} am a ${cancha.horaFin} pm',
                        imageUrl: cancha.imageUrl,
                        progress: 30,
                        onPressed: () => context.go('/reserva/${cancha.id}'),
                      ));
                    }
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: cards,
                    );
                  }
                },
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
