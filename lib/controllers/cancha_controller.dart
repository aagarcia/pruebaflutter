import 'package:flutter/material.dart';
import 'package:pruebaapp/db/database_helper.dart';
import 'package:pruebaapp/models/models.dart';

class CanchaController extends ChangeNotifier {
  final DatabaseHelper _dbHelper;

  CanchaController(this._dbHelper);

  Future<List<Cancha>> obtenerCanchas() async {
    return await _dbHelper.getCanchas();
  }

  Future<Cancha> obtenerCancha(int id) async {
    return await _dbHelper.getCancha(id);
  }
}
