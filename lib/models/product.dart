class Product {
  final int? id;
  final String? title;
  final String? category;
  final String? imagePath;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.imagePath,
});

  factory Product.fromJson(Map<String,dynamic> json){
    return Product(id: json['id'] as int?
        , title: json['title'] as String?,
        category: json['category'] as String?
        , imagePath: json['imagePath'] as String?
    );
  }

}