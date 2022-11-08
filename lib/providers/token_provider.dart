import 'package:flutter/material.dart';

class TokenProvider extends ChangeNotifier {
  String _token = '';

  String get token {
    return this._token;
  }

  set token(String token) {
    this._token = token;
    notifyListeners();
  }
}
