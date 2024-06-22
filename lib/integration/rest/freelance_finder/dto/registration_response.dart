import 'package:intl/intl.dart';

import 'order.dart';

class Role {
  final int id;
  final String name;
  final String authority;

  Role({
    required this.id,
    required this.name,
    required this.authority,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      authority: json['authority'],
    );
  }
}

class Scope {
  int id;
  String name;

  Scope({required this.id, required this.name});

  factory Scope.fromJson(Map<String, dynamic> json) {
    return Scope(
      id: json['id'],
      name: json['name'],
    );
  }
}

class RegistrationResponseDTO {
  final int id;
  final Role role;
  final String username;
  final String email;
  final List<Scope>? scopes;
  final String? aboutMe;
  final String? contact;
  final String registrationDate;
  final DateTime lastOnline;
  final int? rating;
  final List<String> skills;
  final bool isEnabled;
  final bool isAccountNonExpired;
  final bool isAccountNonLocked;
  final bool isCredentialsNonExpired;
  List<Order>? orders;
  final double? price;
  final int ordersCount;

  RegistrationResponseDTO({
    required this.id,
    required this.role,
    required this.username,
    required this.email,
    this.scopes,
    this.aboutMe,
    this.contact,
    required this.registrationDate,
    required this.lastOnline,
    this.rating,
    required this.skills,
    required this.isEnabled,
    required this.isAccountNonExpired,
    required this.isAccountNonLocked,
    required this.isCredentialsNonExpired,
    this.orders,
    this.price,
    required this.ordersCount
  });

  factory RegistrationResponseDTO.fromJson(Map<String, dynamic> json) {
    final DateTime parsedCreationDate = DateTime.parse(json['registrationDate']);
    final String formattedCreationDate = DateFormat('dd.MM.yyyy').format(parsedCreationDate);

    List<String> skillsList = json['skills'] == null ? List.empty() : (json['skills'] as String)
        .split(',')
        .toList();
    skillsList.sort((a, b) => a.length.compareTo(b.length));

    return RegistrationResponseDTO(
      id: json['id'],
      role: Role.fromJson(json['role']),
      username: json['username'],
      email: json['email'],
      scopes: json['scopes'] != null
          ? List<Scope>.from(
              json['scopes'].map((scopeJson) => Scope.fromJson(scopeJson)))
          : null,
      aboutMe: json['aboutMe'],
      contact: json['contact'],
      registrationDate: formattedCreationDate,
      lastOnline: DateTime.parse(json['lastOnline']),
      rating: json['rating'],
      skills: skillsList,
      isEnabled: json['isEnabled'],
      isAccountNonExpired: json['isAccountNonExpired'],
      isAccountNonLocked: json['isAccountNonLocked'],
      isCredentialsNonExpired: json['isCredentialsNonExpired'],
      price: json['price'],
      ordersCount: json['ordersCount']
    );
  }
}
