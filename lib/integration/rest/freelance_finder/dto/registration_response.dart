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

class Authority {
  final int id;
  final String name;
  final String authority;

  Authority({
    required this.id,
    required this.name,
    required this.authority,
  });

  factory Authority.fromJson(Map<String, dynamic> json) {
    return Authority(
      id: json['id'],
      name: json['name'],
      authority: json['authority'],
    );
  }
}

class RegistrationResponseDTO {
  final int id;
  final Role role;
  final String username;
  final String email;
  final dynamic scopes;
  final dynamic aboutMe;
  final dynamic contact;
  final DateTime registrationDate;
  final DateTime lastOnline;
  final dynamic rating;
  final dynamic skills;
  final bool isEnabled;
  final List<Authority> authorities;
  final bool isAccountNonExpired;
  final bool isAccountNonLocked;
  final bool isCredentialsNonExpired;

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
    this.skills,
    required this.isEnabled,
    required this.authorities,
    required this.isAccountNonExpired,
    required this.isAccountNonLocked,
    required this.isCredentialsNonExpired,
  });

  factory RegistrationResponseDTO.fromJson(Map<String, dynamic> json) {
    var authoritiesFromJson = json['authorities'] as List;
    List<Authority> authoritiesList =
    authoritiesFromJson.map((i) => Authority.fromJson(i)).toList();

    return RegistrationResponseDTO(
      id: json['id'],
      role: Role.fromJson(json['role']),
      username: json['username'],
      email: json['email'],
      scopes: json['scopes'],
      aboutMe: json['aboutMe'],
      contact: json['contact'],
      registrationDate: DateTime.parse(json['registrationDate']),
      lastOnline: DateTime.parse(json['lastOnline']),
      rating: json['rating'],
      skills: json['skills'],
      isEnabled: json['isEnabled'],
      authorities: authoritiesList,
      isAccountNonExpired: json['isAccountNonExpired'],
      isAccountNonLocked: json['isAccountNonLocked'],
      isCredentialsNonExpired: json['isCredentialsNonExpired'],
    );
  }
}