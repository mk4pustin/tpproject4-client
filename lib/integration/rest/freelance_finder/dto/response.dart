import 'package:client/integration/rest/freelance_finder/dto/registration_response.dart';

class Response {
  final int id;
  final RegistrationResponseDTO user;

  Response({
    required this.id,
    required this.user,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      id: json['id'],
      user: RegistrationResponseDTO.fromJson(json['user']),
    );
  }
}