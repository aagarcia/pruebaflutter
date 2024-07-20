import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pruebaapp/screens/favorito_body.dart';
import 'package:pruebaapp/screens/home_body.dart';
import 'package:pruebaapp/screens/reserva_body.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeBody(),
    const ReservaBody(),
    const FavoritoBody()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF003F63), Color(0xFF3EC33B)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Image.asset(
          'assets/p4/logo_header.png',
          height: 25,
          width: 124,
        ),
        actions: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/p4/user_bar.png'),
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == 'logout') {
                context.go('/');
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Cerrar sesión'),
              ),
            ],
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.grey.shade200,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Reservas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
          ],
          selectedItemColor: const Color(0xFF82BC00),
        ),
      ),
    );
  }
}
