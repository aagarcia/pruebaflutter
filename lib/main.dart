import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:pruebaapp/controllers/controllers.dart';
import 'package:pruebaapp/db/database_helper.dart';
import 'package:pruebaapp/providers/providers.dart';
import 'package:pruebaapp/routes/rutas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es_ES', null);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegistroProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseHelper(),
        ),
        ChangeNotifierProvider(
          create: (_) => ClimaProvider(),
        ),
        ChangeNotifierProvider(create: (_) {
          final cityProvider = CityProvider();
          cityProvider.getRandomCity();
          return cityProvider;
        }),
        ChangeNotifierProxyProvider<DatabaseHelper, InstructorController>(
          create: (context) =>
              InstructorController(context.read<DatabaseHelper>()),
          update: (context, databaseHelper, instructorController) =>
              InstructorController(databaseHelper),
        ),
        ChangeNotifierProxyProvider<DatabaseHelper, CanchaController>(
          create: (context) => CanchaController(context.read<DatabaseHelper>()),
          update: (context, databaseHelper, canchaController) =>
              CanchaController(databaseHelper),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRoutes.router,
    );
  }
}
