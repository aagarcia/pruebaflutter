import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pruebaapp/components/components.dart';
import 'package:pruebaapp/controllers/controllers.dart';
import 'package:pruebaapp/models/models.dart';

class Confirmacion extends StatelessWidget {
  final int idCancha;
  const Confirmacion({super.key, required this.idCancha});

  @override
  Widget build(BuildContext context) {
    CanchaController canchaController =
        Provider.of<CanchaController>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Carrusel(
              onPressed: () => context.go('/reserva/$idCancha'),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<Cancha>(
                future: canchaController.obtenerCancha(idCancha),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return const Center(
                        child: Text('No hay canchas disponibles'));
                  } else {
                    return InformacionCancha(
                      cancha: snapshot.data!,
                    );
                  }
                },
              ),
            ),
            Container(
              color: const Color(0xFFF4F7FC),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Resumen',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.sports_tennis, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Cancha tipo A',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(Icons.calendar_today, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '10 de Julio 2024',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Instructor: Alex Garcia A.',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(Icons.access_time, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '2 horas',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Total a pagar',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$50',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF346BC3)),
                          ),
                          Text(
                            'Por 2 horas',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Lógica del botón "Reprogramar reserva"
                      },
                      icon: const Icon(Icons.calendar_today),
                      label: const Text('Reprogramar reserva'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF346BC3),
                        side: const BorderSide(color: Color(0xFF346BC3)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Column(
                      children: [
                        ButtonGreen(onPressed: () {}, textButton: 'Pagar'),
                        const SizedBox(height: 16),
                        OutlinedButton(
                          onPressed: () {
                            context.go('/reserva/$idCancha');
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF3D3D3D)),
                            //backgroundColor: Colors.black.withOpacity(0.2),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(
                                color: Color(0xFF3D3D3D), fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
