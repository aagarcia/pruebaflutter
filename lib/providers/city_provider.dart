import 'dart:math';
import 'package:flutter/material.dart';

class CityProvider with ChangeNotifier {
  final List<String> _listCiudades = [
    "Guayaquil,EC",
    "Santiago de Cali,CO",
    "Caracas,VE",
    "San Miguelito,PA",
    "Limatambo,PE"
  ];

  String? _selectedCity;

  String? get selectedCity => _selectedCity;

  void getRandomCity() {
    final random = Random();
    int randomIndex = random.nextInt(_listCiudades.length);
    _selectedCity = _listCiudades[randomIndex];
    notifyListeners();
  }
}
