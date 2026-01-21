import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:laza_ecommerce/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const BASE_URL = "https://dummyjson.com";

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List list = decoded['products'];

      final List<Product> products = [];

      for (var item in list) {
        try {
          products.add(Product.fromJson(item));
        } catch (e) {
          debugPrint('❌ Product parse error: $e');
        }
      }

      debugPrint('✅ Parsed products: ${products.length}');
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }




  Future<Product> getProductById(int id) async {
    final response = await http.get(Uri.parse('$BASE_URL/products/$id'));
    debugPrint("response check ${response.statusCode}");
    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Product.fromJson(data);
    }else {
      throw Exception('Failed to load data by id');
    }
  }


}