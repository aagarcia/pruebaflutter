import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pruebaapp/components/components.dart';

class Reserva extends StatefulWidget {
  const Reserva({super.key});

  @override
  State<Reserva> createState() => _ReservaState();
}

class _ReservaState extends State<Reserva> {
  int _current = 0;
  final List<String> _imgList = [
    'assets/p5/carrusel.png',
    'assets/p5/carrusel.png',
    'assets/p5/carrusel.png',
  ];
  final CarouselController _controller = CarouselController();

  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text =
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 269, // Establecemos la altura fija para el carrusel
                  child: CarouselSlider.builder(
                    itemCount: _imgList.length,
                    itemBuilder: (context, index, realIndex) {
                      return Image.asset(
                        _imgList[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                    options: CarouselOptions(
                      height: 269,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    carouselController: _controller,
                  ),
                ),
                BackButtonComponent(onPressed: () {}),
                Positioned(
                  top: 40.0,
                  right: 10.0,
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border,
                        color: Colors.black, size: 30),
                    onPressed: () {
                      // Implementar la acción del ícono de corazón
                    },
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 0.0,
                  right: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFFB2C4AD)
                                    : const Color(0xFFAAF724))
                                .withOpacity(_current == entry.key ? 0.9 : 0.4),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            // Bloque 2: Información de la cancha sin el combo de instructores
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Epic Box',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Cancha tipo A',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\$25',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Por hora',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 12),
                      SizedBox(width: 4),
                      Text(
                        'Disponible',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.access_time, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '7:00 am a 4:00 pm',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Via Av. Caracas y Av. P.º Caroni',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Bloque 3: Resumen
            Container(
              color: Colors.grey[200],
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
            // Bloque 4: Pago y acciones
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
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Por 2 horas',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: () {
                      // Lógica del botón "Reprogramar reserva"
                    },
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('Reprogramar reserva'),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Lógica del botón "Pagar"
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 16.0),
                            child: Text(
                              'Pagar',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        OutlinedButton(
                          onPressed: () {
                            // Lógica del botón "Cancelar"
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.black),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 16.0),
                            child: Text(
                              'Cancelar',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
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
