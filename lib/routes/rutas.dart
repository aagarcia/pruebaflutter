import 'package:go_router/go_router.dart';
import 'package:pruebaapp/screens/screens.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Inicio(),
      ),
      GoRoute(
        path: '/sesion',
        builder: (context, state) => const Sesion(),
      ),
      GoRoute(
        path: '/registro',
        builder: (context, state) => const Registro(),
      ),
      GoRoute(
        path: '/principal',
        builder: (context, state) => const Principal(),
      ),
      GoRoute(
        path: '/reserva',
        builder: (context, state) => const Reserva(),
      ),
      GoRoute(
        path: '/confirmacion',
        builder: (context, state) => const Confirmacion(),
      ),
    ],
  );
}
