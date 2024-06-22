import 'package:flutter/material.dart';

class UserIdProvider with ChangeNotifier {
  int? _userId;

  int? get userId => _userId;

  void setUserId(int id) {
    _userId = id;
    notifyListeners();
  }

  static final UserIdProvider _instance = UserIdProvider._internal();

  factory UserIdProvider() {
    return _instance;
  }

  UserIdProvider._internal();
}