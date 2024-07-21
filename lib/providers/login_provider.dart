import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isCheck = false;
  bool _isObscured = true;

  bool get isCheck => _isCheck;
  bool get isObscured => _isObscured;

  void changeCheck(bool isCheck) {
    _isCheck = isCheck;
    notifyListeners();
  }

  void changeObscured() {
    _isObscured = !_isObscured;
    notifyListeners();
  }
}
