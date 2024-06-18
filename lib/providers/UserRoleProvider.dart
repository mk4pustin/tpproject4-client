import 'package:flutter/material.dart';

import 'dto/UserRole.dart';

class UserRoleProvider with ChangeNotifier {
  UserRole _userRole = UserRole.guest;

  UserRole get userRole => _userRole;

  void setUserRole(UserRole role) {
    _userRole = role;
    notifyListeners();
  }

  static final UserRoleProvider _instance = UserRoleProvider._internal();

  factory UserRoleProvider() {
    return _instance;
  }

  UserRoleProvider._internal();
}