import 'package:client/integration/rest/freelance_finder/dto/registration_response.dart';
import 'package:intl/intl.dart';

import 'order.dart';

class Complaint {
  int id;
  RegistrationResponseDTO initiator;
  RegistrationResponseDTO? user;
  RegistrationResponseDTO? admin;
  Order? order;
  String description;
  String creationDate;
  String status;
  String? adminComment;

  Complaint({
    required this.id,
    required this.initiator,
    this.user,
    required this.admin,
    this.order,
    required this.description,
    required this.creationDate,
    required this.status,
    this.adminComment,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    final DateTime parsedCreationDate = DateTime.parse(json['creationDate']);
    final String formattedCreationDate =
    DateFormat('dd.MM.yyyy').format(parsedCreationDate);

    return Complaint(
      id: json['id'],
      initiator: RegistrationResponseDTO.fromJson(json['initiator']),
      user: json['user'] != null
          ? RegistrationResponseDTO.fromJson(json['user'])
          : null,
      admin: json['admin'] != null
          ? RegistrationResponseDTO.fromJson(json['admin'])
          : null,
      order: json['order'] != null
          ? Order.fromJson(json['order'])
          : null,
      description: json['description'],
      creationDate: formattedCreationDate,
      status: json['status'],
      adminComment: json['adminComment'],
    );
  }
}
