class CommentDTO {
  final int orderId;
  final int rating;
  final String description;

  CommentDTO({
    required this.orderId,
    required this.rating,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'rating': rating,
      'description': description,
    };
  }
}