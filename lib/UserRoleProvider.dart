import 'package:client/UserRole.dart';
import 'package:flutter/material.dart';

class UserRoleProvider with ChangeNotifier {
  UserRole _userRole = UserRole.guest;

  UserRole get userRole => _userRole;

  void setUserRole(UserRole role) {
    _userRole = role;
    notifyListeners();
  }
}