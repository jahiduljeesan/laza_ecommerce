class Product {
  final int? id;
  final String? title;
  final String? category;
  final String? imagePath;
  final double? price;

  Product({
    this.id,
    this.title,
    this.category,
    this.imagePath,
    this.price,
});

  factory Product.fromJson(Map<String,dynamic> json){
    final priceValue = json['price'];
    double? priceDouble;

    if(priceValue is num) {
      priceDouble = priceValue.toDouble();
    }

    return Product(id: json['id'] as int?
        , title: json['title'] as String?,
        category: json['category'] as String?
        , imagePath: json['image'] as String?,
      price: priceDouble
    );
  }

}