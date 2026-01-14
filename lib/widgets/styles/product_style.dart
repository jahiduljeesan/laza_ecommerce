import 'package:flutter/material.dart';
import 'package:laza_ecommerce/models/product.dart';
class ProductStyle extends StatelessWidget {

  final Product product;

  ProductStyle({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(

        color: Colors.green,
      ),
    );
  }
}
