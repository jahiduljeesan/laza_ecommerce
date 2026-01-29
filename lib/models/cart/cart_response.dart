class CartResponse {
  double total;
  double discountedTotal;
  int totalProducts;
  int totalQuantity;
  List<CartProduct> products;

  CartResponse({
    required this.total,
    required this.discountedTotal,
    required this.totalProducts,
    required this.totalQuantity,
    required this.products,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      total: (json['total'] as num).toDouble(),
      discountedTotal: (json['discountedTotal'] as num).toDouble(),
      totalProducts: (json['totalProducts'] as num).toInt(),
      totalQuantity: (json['totalQuantity'] as num).toInt(),
      products: (json['products'] as List)
          .map((e) => CartProduct.fromJson(e))
          .toList(),
    );
  }
}

class CartProduct {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedPrice;
  final String thumbnail;

  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
    required this.thumbnail,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      total: (json['total'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      discountedPrice: (json['discountedPrice'] as num).toDouble(),
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'total': total,
      'discountPercentage': discountPercentage,
      'discountedPrice': discountedPrice,
      'thumbnail': thumbnail,
    };
  }
}
