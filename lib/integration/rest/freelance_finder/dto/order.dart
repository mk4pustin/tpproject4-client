import 'package:client/integration/rest/freelance_finder/dto/registration_response.dart';
import 'package:intl/intl.dart';

class Order {
  int id;
  RegistrationResponseDTO? freelancer;
  RegistrationResponseDTO orderer;
  String title;
  List<Scope> scopes;
  double price;
  String description;
  String creationDate;
  int responsesCount;
  String status;
  List<String> skills;

  Order({
    required this.id,
    this.freelancer,
    required this.title,
    required this.orderer,
    required this.scopes,
    required this.price,
    required this.description,
    required this.creationDate,
    required this.responsesCount,
    required this.status,
    required this.skills,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    var scopesList = json['scopes'] as List;
    List<Scope> scopes = scopesList.map((i) => Scope.fromJson(i)).toList();

    final DateTime parsedCreationDate = DateTime.parse(json['creationDate']);
    final String formattedCreationDate =
        DateFormat('dd.MM.yyyy').format(parsedCreationDate);

    List<String> skillsList = (json['skills'] as String)
        .split(',')
        .toList();
    skillsList.sort((a, b) => a.length.compareTo(b.length));
    return Order(
      id: json['id'],
      freelancer: json['freelancer'] != null
          ? RegistrationResponseDTO.fromJson(json['freelancer'])
          : null,
      title: json['title'],
      orderer: RegistrationResponseDTO.fromJson(json['orderer']),
      scopes: scopes,
      price: json['price']?.toDouble(),
      description: json['description'],
      creationDate: formattedCreationDate,
      responsesCount: json['responsesCount'],
      status: json['status'],
      skills: skillsList,
    );
  }
}
