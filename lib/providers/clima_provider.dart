import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pruebaapp/models/models.dart';
import 'package:pruebaapp/util/funciones_varias.dart';

class ClimaProvider extends ChangeNotifier {
  Clima? _clima;
  String? _iconUrl;
  String? _errorApi = '';

  Clima? get clima => _clima;
  String? get iconUrl => _iconUrl;
  String? get error => _errorApi;

  Future<void> fetchClima(String selectedCity) async {
    final String url = FuncionesVarias.getUrl(selectedCity);

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _clima = climaFromJson(response.body);
        fetchIconUrl(_clima!.weather![0].icon!);
      } else {
        throw Exception('Failed to load clima');
      }
      _errorApi = '';
      notifyListeners();
    } catch (e) {
      _errorApi = e.toString();
      notifyListeners();
    }
  }

  void fetchIconUrl(String iconCode) {
    _iconUrl = FuncionesVarias.getIconUrl(iconCode);
    notifyListeners();
  }
}
