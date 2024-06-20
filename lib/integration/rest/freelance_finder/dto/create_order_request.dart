class CreateOrderRequest {
  String title;
  List<String> scopes;
  double price;
  String description;
  String skills;

  CreateOrderRequest({
    required this.title,
    required this.scopes,
    required this.price,
    required this.description,
    required this.skills,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'scopes': scopes,
      'price': price,
      'description': description,
      'skills': skills,
    };
  }
}