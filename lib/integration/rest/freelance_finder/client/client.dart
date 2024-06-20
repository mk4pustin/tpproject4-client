import 'dart:convert';
import 'package:client/integration/rest/freelance_finder/dto/order.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../dto/create_order_request.dart';
import '../dto/login_request.dart';
import '../dto/registration_request.dart';
import '../dto/registration_response.dart';
import '../dto/update_request.dart';

class FreelanceFinderService {
  FreelanceFinderService._privateConstructor();

  static final FreelanceFinderService instance = FreelanceFinderService._privateConstructor();

  static const serverPath = "http://85.92.111.152:8080/";
  static const registrationEndpoint = "api/auth/registration";
  static const updateEndpoint = "api/user/updateProfile";
  static const loginEndpoint = "api/auth/authentication";
  static const allOrdersEndpoint = "api/all/orders";
  static const allFreelancersEndpoint = "api/all/freelancers";
  static const createFreelancerRequestEndpoint = "api/freelancer/requestOrder/{orderId}";
  static const createOrderEndpoint = "api/customer/createOrder";
  static const getUserByIdEndpoint = "api/all/freelancers/{id}";
  static const getUserOrders = "api/all/users/{id}/orders";
  static const deleteUserEndpoint = "api/admin/users/{id}";

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

  Future<RegistrationResponseDTO> updateUser(UpdateRequestDTO request ,
      String authToken,) async {
    final response = await http.post(
      Uri.parse(serverPath + updateEndpoint),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken",
      },
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
      throw Exception('Failed to update user');
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

  Future<List<RegistrationResponseDTO>> fetchAllFreelancers() async {
    final response = await http.get(Uri.parse(serverPath + allFreelancersEndpoint));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(utf8.decode(response.bodyBytes));
      return jsonData.map((freelancerJson) => RegistrationResponseDTO.fromJson(freelancerJson)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<void> sendRequestToCreateFreelancerRequest(String orderId, String accessToken) async {
    String url = serverPath + createFreelancerRequestEndpoint.replaceAll('{orderId}', orderId);

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Authorization': 'Bearer $accessToken'
        },
      );

      if (response.statusCode == 201) {
        print('Request sent successfully');
      } else {
        print('Failed to send request. Status code: ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      print('Exception during request: $e');
      throw Exception();
    }
  }

  Future<void> createOrder(
      CreateOrderRequest orderRequest,
      String authToken,
      ) async {
    final Uri url = Uri.parse(serverPath + createOrderEndpoint);

    final http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $authToken",
      },
      body: jsonEncode(orderRequest.toJson()),
    );

    print(response.statusCode);
    if (response.statusCode == 201) {
      print("Order created successfully");
    } else {
      print("Failed to create order: ${response.statusCode}");
      print("Response body: ${response.body}");
      throw Exception("Failed to create order");
    }
  }

  Future<RegistrationResponseDTO> getUserById(int id) async {
    String url = serverPath + getUserByIdEndpoint.replaceAll('{id}', id.toString());
    final response = await http.get(Uri.parse(url));

    String ordersUrl = serverPath + getUserOrders.replaceAll('{id}', id.toString());
    final ordersResponse = await http.get(Uri.parse(ordersUrl));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(utf8.decode(response.bodyBytes));
      final user = RegistrationResponseDTO.fromJson(responseData);

      List<dynamic> jsonData = json.decode(utf8.decode(ordersResponse.bodyBytes));
      final orders = jsonData.map((orderJson) => Order.fromJson(orderJson)).toList();

      user.orders = orders;
      return user;
    } else {
      throw Exception('Failed to load user: ${response.body}');
    }
  }

  Future<void> deleteUser(int userId, String token) async {
    String url = serverPath + deleteUserEndpoint.replaceAll('{id}', userId.toString());
    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print('Пользователь успешно удален');
    } else {
      throw Exception('Не удалось удалить пользователя. Статус код: ${response.statusCode}');
    }
  }
}

