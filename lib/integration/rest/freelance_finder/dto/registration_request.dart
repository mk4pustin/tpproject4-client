class RegistrationRequestDTO {
  final String username;
  final String password;
  final String email;
  final String role;

  RegistrationRequestDTO({
    required this.username,
    required this.password,
    required this.email,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "email": email,
      "role": role,
    };
  }
}