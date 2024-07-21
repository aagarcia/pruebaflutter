import 'dart:async';
import 'package:path/path.dart';
import 'package:pruebaapp/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class DatabaseHelper with ChangeNotifier {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper._internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    await _checkAndInsertInitialDataInstructores();
    await _checkAndInsertInitialDataCanchas();
    return _db;
  }

  Future<Database> initDb() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, 'tenis.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS instructores (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS canchas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        tipo TEXT NOT NULL,
        horaIni TEXT NOT NULL,
        horaFin TEXT NOT NULL,
        direccion TEXT NOT NULL,
        disponibilidad TEXT NOT NULL,
        valor REAL NOT NULL,
        imageUrl TEXT NOT NULL
      )
    ''');
  }

  Future<void> _checkAndInsertInitialDataCanchas() async {
    Database dbClient = await db as Database;
    List<Map<String, dynamic>> result =
        await dbClient.rawQuery('SELECT COUNT(*) FROM canchas');
    int count = Sqflite.firstIntValue(result)!;
    if (count == 0) {
      // Insertar datos iniciales si la tabla está vacía
      await dbClient.transaction((txn) async {
        Batch batch = txn.batch();
        batch.insert('canchas', {
          'nombre': 'Epic Box',
          'tipo': 'Cancha tipo A',
          'horaIni': '07:00',
          'horaFin': '17:00',
          'direccion': 'Vía Av. Caracas y Av. P.º Caroni',
          'disponibilidad': 'Disponible',
          'valor': 50.0,
          'imageUrl': 'assets/p4/epic_box_rectangulo.png'
        });
        batch.insert('canchas', {
          'nombre': 'Rusty Tennis',
          'tipo': 'Cancha tipo B',
          'horaIni': '07:00',
          'horaFin': '17:00',
          'direccion': 'Vía Av. Caracas y Av. P.º Caroni',
          'disponibilidad': 'Disponible',
          'valor': 25.0,
          'imageUrl': 'assets/p4/rusty_tenis_rectangulo.png'
        });
        batch.insert('canchas', {
          'nombre': 'Cancha Multiple',
          'tipo': 'Cancha tipo C',
          'horaIni': '07:00',
          'horaFin': '15:00',
          'direccion': 'Vía Av. Caracas y Av. P.º Caroni',
          'disponibilidad': 'No disponible',
          'valor': 50.0,
          'imageUrl': 'assets/p4/cancha_multiple_rectangulo.png'
        });
        await batch.commit();
      });
    }
  }

  Future<void> _checkAndInsertInitialDataInstructores() async {
    Database dbClient = await db as Database;
    List<Map<String, dynamic>> result =
        await dbClient.rawQuery('SELECT COUNT(*) FROM instructores');
    int count = Sqflite.firstIntValue(result)!;
    if (count == 0) {
      // Insertar datos iniciales si la tabla está vacía
      await dbClient.transaction((txn) async {
        Batch batch = txn.batch();
        batch.insert('instructores', {'nombre': 'Pepito Rosales'});
        batch.insert('instructores', {'nombre': 'Maria Lopez'});
        await batch.commit();
      });
    }
  }

  //Instructores
  Future<List<Instructor>> getInstructores() async {
    Database dbClient = await db as Database;
    List<Map<String, dynamic>> maps = await dbClient.query('instructores');
    return List.generate(maps.length, (i) {
      return Instructor.fromJson(maps[i]);
    });
  }

  //Canchas
  Future<List<Cancha>> getCanchas() async {
    Database dbClient = await db as Database;
    List<Map<String, dynamic>> maps = await dbClient.query('canchas');
    return List.generate(maps.length, (i) {
      return Cancha.fromJson(maps[i]);
    });
  }

  Future<Cancha> getCancha(int id) async {
    Database dbClient = await db as Database;
    List<Map<String, dynamic>> maps =
        await dbClient.query('canchas', where: 'id = ?', whereArgs: [id]);
    return Cancha.fromJson(maps.first);
  }

  /* Future<int> insertUsuario(Usuario usuario) async {
    Database dbClient = await db as Database;
    int id = await dbClient.insert('usuarios', usuario.toMap());
    notifyListeners();
    return id;
  } */

  /* Future<List<Usuario>> getUsuarios() async {
    Database dbClient = await db as Database;
    List<Map<String, dynamic>> maps = await dbClient.query('usuarios');
    return List.generate(maps.length, (i) {
      return Usuario.fromMap(maps[i]);
    });
  } */

  /* Future<void> updateUsuario(Usuario usuario) async {
    Database dbClient = await db as Database;
    await dbClient.update(
      'usuarios',
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [usuario.id],
    );
    notifyListeners();
  } */

  /* Future<void> deleteUsuario(int id) async {
    Database dbClient = await db as Database;
    await dbClient.delete(
      'usuarios',
      where: 'id = ?',
      whereArgs: [id],
    );
    notifyListeners();
  } */

  Future<void> close() async {
    Database dbClient = await db as Database;
    await dbClient.close();
  }
}
