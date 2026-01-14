class Product {
  final String id;
  final String title;
  final String category;
  final String imagePath;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.imagePath,
});

  factory Product.fromJson(Map<String,dynamic> json){
    return Product(id: json['id'], title: json['title'],
        category: json['category'], imagePath: json['imagePath']);
  }

}