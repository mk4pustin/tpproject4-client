import 'package:client/integration/rest/freelance_finder/dto/registration_response.dart';
import 'package:intl/intl.dart';

import 'order.dart';

class Freelancer {
  int id;
  String username;
  String email;
  String aboutMe;
  String contact;
  String registrationDate;
  String lastOnline;
  double rating;
  List<String> skills;
  List<Scope> scopes;
  Order? lastOrder;

  Freelancer({
    required this.id,
    required this.username,
    required this.email,
    required this.aboutMe,
    required this.contact,
    required this.registrationDate,
    required this.lastOnline,
    required this.rating,
    required this.skills,
    required this.scopes,
    required this.lastOrder,
  });

  factory Freelancer.fromJson(Map<String, dynamic> json) {
    var scopesList = json['scopes'] as List;
    List<Scope> scopes = scopesList.map((i) => Scope.fromJson(i)).toList();

    final DateTime parsedRegistrationDate = DateTime.parse(json['registrationDate']);
    final String formattedRegistrationDate =
    DateFormat('dd.MM.yyyy').format(parsedRegistrationDate);

    final DateTime? parsedLastOnline = json['lastOnline'] != null
        ? DateTime.parse(json['lastOnline'])
        : null;
    final String? formattedLastOnline = parsedLastOnline != null
        ? DateFormat('dd.MM.yyyy').format(parsedLastOnline)
        : null;

    List<String> skillsList = (json['skills'] as String)
        .split(',')
        .toList();
    skillsList.sort((a, b) => a.length.compareTo(b.length));

    return Freelancer(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      aboutMe: json['aboutMe'],
      contact: json['contact'],
      registrationDate: formattedRegistrationDate,
      lastOnline: formattedLastOnline ?? '',
      rating: json['rating']?.toDouble(),
      skills: skillsList,
      scopes: scopes,
      lastOrder: json['lastOrder'] != null
          ? Order.fromJson(json['lastOrder'])
          : null,
    );
  }
}