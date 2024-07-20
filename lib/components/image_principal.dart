import 'package:flutter/material.dart';

class ImagePrincipal extends StatelessWidget {
  const ImagePrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Image.asset(
        'assets/p2/imagenp2.png',
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height * 0.4,
      ),
    );
  }
}
