import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pruebaapp/components/components.dart';

class Carrusel extends StatefulWidget {
  final VoidCallback? onPressed;
  const Carrusel({super.key, this.onPressed});

  @override
  State<Carrusel> createState() => _CarruselState();
}

class _CarruselState extends State<Carrusel> {
  int _current = 0;
  final List<String> _imgList = [
    'assets/p5/carrusel.png',
    'assets/p5/carrusel.png',
    'assets/p5/carrusel.png',
  ];
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            carouselController: controller,
          ),
        ),
        BackButtonComponent(onPressed: widget.onPressed),
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
                onTap: () => controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFAAF724)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
