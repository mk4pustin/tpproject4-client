import 'package:flutter/material.dart';

import '../models/user_role.dart';

class UserRoleProvider with ChangeNotifier {
  UserRole _userRole = UserRole.Guest;

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
