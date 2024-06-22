class CreateClaimRequest {
  final int? userId;
  final int? orderId;
  final String description;

  CreateClaimRequest({
    this.userId,
    this.orderId,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId ?? 'null',
      'orderId': orderId ?? 'null',
      'description': description,
    };
  }
}