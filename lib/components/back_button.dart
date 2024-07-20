import 'package:flutter/material.dart';

class BackButtonComponent extends StatelessWidget {
  final VoidCallback? onPressed;
  const BackButtonComponent({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.0,
      left: 10.0,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFAAF724),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
