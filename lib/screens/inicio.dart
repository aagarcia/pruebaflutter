import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pruebaapp/components/components.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/p1/fondop1.png',
              fit: BoxFit.cover,
            ),
          ),
          // Logo
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            child: Center(
              child: SvgPicture.asset(
                'assets/p1/logop1.svg',
                height: 148.0,
                width: 209.0,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: ButtonGreen(
                  onPressed: () => context.go('/sesion'),
                  textButton: 'Iniciar sesión',
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: OutlinedButton(
                  onPressed: () => context.go('/registro'),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white.withOpacity(0.2)),
                    backgroundColor: Colors.white.withOpacity(0.2),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Registrarme',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
