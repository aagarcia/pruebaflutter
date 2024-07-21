import 'package:flutter/material.dart';
import 'package:pruebaapp/db/database_helper.dart';
import 'package:pruebaapp/models/models.dart';

class InstructorController with ChangeNotifier {
  final DatabaseHelper _dbHelper;

  InstructorController(this._dbHelper);

  Future<List<Instructor>> obtenerInstructores() async {
    return await _dbHelper.getInstructores();
  }
}
