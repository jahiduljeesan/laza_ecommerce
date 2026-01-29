class CartRequest {
  final int id;
  final int quantity;

  CartRequest({
    required this.id,
    required this.quantity,
  });

  factory CartRequest.fromJson(Map<String, dynamic> json) {
    return CartRequest(
      id: json['id'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }
}
