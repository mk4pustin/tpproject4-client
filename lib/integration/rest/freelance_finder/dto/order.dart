import 'package:client/integration/rest/freelance_finder/dto/registration_response.dart';

class Order {
  int id;
  RegistrationResponseDTO freelancer;
  RegistrationResponseDTO orderer;
  String title;
  List<Scope> scopes;
  double price;
  String description;
  DateTime creationDate;
  int responsesCount;
  String status;
  String skills;

  Order({
    required this.id,
    required this.freelancer,
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

    return Order(
      id: json['id'],
      freelancer: RegistrationResponseDTO.fromJson(json['freelancer']),
      title: json['title'],
      orderer: RegistrationResponseDTO.fromJson(json['orderer']),
      scopes: scopes,
      price: json['price']?.toDouble(),
      description: json['description'],
      creationDate: DateTime.parse(json['creationDate']),
      responsesCount: json['responsesCount'],
      status: json['status'],
      skills: json['skills'],
    );
  }
}
