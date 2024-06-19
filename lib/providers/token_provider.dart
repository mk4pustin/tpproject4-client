import 'package:flutter/material.dart';

class TokenProvider with ChangeNotifier {
  String? _token;

  String? get token => _token;

  void setToken(String? id) {
    _token = id;
    notifyListeners();
  }

  static final TokenProvider _instance = TokenProvider._internal();

  factory TokenProvider() {
    return _instance;
  }

  TokenProvider._internal();
}
