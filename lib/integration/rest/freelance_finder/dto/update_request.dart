class UpdateRequestDTO {
  final String username;
  final String password;
  final String aboutMe;
  final String contact;
  final String price;

  UpdateRequestDTO({
    required this.username,
    required this.password,
    required this.aboutMe,
    required this.contact,
    required this.price
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "aboutMe": aboutMe,
      "contact": contact,
      "price": price
    };
  }
}