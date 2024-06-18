import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../dto/login_request.dart';
import '../dto/registration_request.dart';

class FreelanceFinderService {
  FreelanceFinderService._privateConstructor();

  static final FreelanceFinderService instance = FreelanceFinderService._privateConstructor();

  static const serverPath = "http://85.92.111.152:8080/";
  static const registrationEndpoint = "api/auth/registration";
  static const loginEndpoint = "api/auth/authentication";

  Future<int> registerUser(RegistrationRequestDTO request) async {
    final response = await http.post(
      Uri.parse(serverPath + registrationEndpoint),
      headers: {"Content-Type": "application/json"},
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final token = response.headers['authorization'];

      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
      }

      return responseData['id'];
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<int> loginUser(LoginRequestDTO request) async {
    final response = await http.post(
      Uri.parse(serverPath + loginEndpoint),
      headers: {"Content-Type": "application/json"},
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final token = response.headers['authorization'];

      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
      }

      return responseData['id'];
    } else {
      throw Exception('Failed to login user');
    }
  }
}

