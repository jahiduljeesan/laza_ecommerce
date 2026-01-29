class CartRequest {
  final int userId;
  final List<CartBody> cartBodyList;

  CartRequest({
    required this.userId,
    required this.cartBodyList,
  });

  factory CartRequest.fromJson(Map<String, dynamic> json) {
    return CartRequest(
        userId: json['userId'],
        cartBodyList: (json['products'] as List)
            .map((e) => CartBody.fromJson(e))
            .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'products': cartBodyList,
    };
  }
}

class CartBody {
  final int id;
  final int quantity;

  CartBody({
    required this.id,
    required this.quantity,
  });

  factory CartBody.fromJson(Map<String, dynamic> json) {
    return CartBody(
      id: json['id'],
      quantity: (json['quantity']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }
}
