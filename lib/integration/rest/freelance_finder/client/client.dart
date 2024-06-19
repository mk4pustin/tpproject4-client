import 'dart:convert';
import 'package:client/integration/rest/freelance_finder/dto/order.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../dto/login_request.dart';
import '../dto/registration_request.dart';
import '../dto/registration_response.dart';

class FreelanceFinderService {
  FreelanceFinderService._privateConstructor();

  static final FreelanceFinderService instance = FreelanceFinderService._privateConstructor();

  static const serverPath = "http://85.92.111.152:8080/";
  static const registrationEndpoint = "api/auth/registration";
  static const loginEndpoint = "api/auth/authentication";
  static const allOrdersEndpoint = "api/all/orders";

  Future<RegistrationResponseDTO> registerUser(RegistrationRequestDTO request) async {
    final response = await http.post(
      Uri.parse(serverPath + registrationEndpoint),
      headers: {"Content-Type": "application/json"},
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(utf8.decode(response.bodyBytes));
      final user = RegistrationResponseDTO.fromJson(responseData);
      final token = response.headers['authorization'];

      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setInt('id', user.id);
        await prefs.setString('role', user.role.name);
      }

      return user;
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<RegistrationResponseDTO> loginUser(LoginRequestDTO request) async {
    final response = await http.post(
      Uri.parse(serverPath + loginEndpoint),
      headers: {"Content-Type": "application/json"},
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(utf8.decode(response.bodyBytes));
      final user = RegistrationResponseDTO.fromJson(responseData);
      final token = response.headers['authorization'];

      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setInt('id', user.id);
        await prefs.setString('role', user.role.name);
      }

      return RegistrationResponseDTO.fromJson(responseData);
    } else {
      throw Exception('Failed to login user');
    }
  }

  Future<List<Order>> fetchAllOrders() async {
    final response = await http.get(Uri.parse(serverPath + allOrdersEndpoint));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(utf8.decode(response.bodyBytes));
      return jsonData.map((orderJson) => Order.fromJson(orderJson)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }
}

