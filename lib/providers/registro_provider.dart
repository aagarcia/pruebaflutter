import 'package:flutter/material.dart';

class RegistroProvider extends ChangeNotifier {
  bool _isObscured = true;
  bool _isObscured2 = true;

  bool get isObscured => _isObscured;
  bool get isObscured2 => _isObscured2;

  void changeObscured() {
    _isObscured = !_isObscured;
    notifyListeners();
  }

  void changeObscured2() {
    _isObscured2 = !_isObscured2;
    notifyListeners();
  }
}
