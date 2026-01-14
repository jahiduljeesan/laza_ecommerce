import 'dart:convert';

import 'package:laza_ecommerce/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const BASE_URL = "https://fakestoreapi.com";

  Future<List<Product>> getProduct() async{
    final response = await http.get(Uri.parse('$BASE_URL/products'));

    if(response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e)=> Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}