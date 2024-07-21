import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pruebaapp/components/components.dart';
import 'package:pruebaapp/providers/providers.dart';

class Sesion extends StatelessWidget {
  const Sesion({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const ImagePrincipal(),
            BackButtonComponent(onPressed: () => context.go('/')),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.40,
                left: 32.0,
                right: 32.0,
                bottom: 16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 2,
                    color: const Color(0xFF346BC3),
                  ),
                  const SizedBox(height: 30),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.grey, // Cambia el color del label
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey, // Cambia el color del ícono
                      ),
                      border: InputBorder.none, // Elimina el borde por defecto
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey), // Borde inferior
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .grey), // Borde inferior cuando está enfocado
                      ),
                      hintText: 'usuario@email.com',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    style: TextStyle(
                      color: Colors.black, // Cambia el color del texto
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: const TextStyle(
                        color: Colors.grey, // Cambia el color del label
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey, // Cambia el color del ícono
                      ),
                      suffixIcon: IconButton(
                        icon: loginProvider.isObscured
                            ? const Icon(Icons.visibility, color: Colors.grey)
                            : const Icon(Icons.visibility_off,
                                color: Colors.grey),
                        onPressed: () => loginProvider.changeObscured(),
                      ),
                      border: InputBorder.none, // Elimina el borde por defecto
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey), // Borde inferior
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .grey), // Borde inferior cuando está enfocado
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black, // Cambia el color del texto
                    ),
                    obscureText: loginProvider.isObscured,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: loginProvider.isCheck,
                        onChanged: (bool? value) =>
                            loginProvider.changeCheck(value!),
                      ),
                      const Text('Recordar contraseña'),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                      ),
                      child: const Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(
                          color: Color(0xFF346BC3),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonGreen(
                    onPressed: () => context.go('/principal'),
                    textButton: 'Iniciar sesión',
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '¿Aun no tienes cuenta? ',
                          style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () => context.go('/registro'),
                          style: TextButton.styleFrom(
                            overlayColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Regístrate',
                            style: TextStyle(
                              color: Color(0xFF346BC3),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
