class Order {
  final String title;
  final String price;
  final int responses;
  final String postDate;
  final List<String> tags;

  Order({required this.title, required this.price, required this.responses, required this.postDate, required this.tags});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      title: json['title'],
      price: json['price'],
      responses: json['responses'],
      postDate: json['postDate'],
      tags: List<String>.from(json['tags']),
    );
  }
}