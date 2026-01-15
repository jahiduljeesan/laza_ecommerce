import 'dart:convert';
import 'dart:ffi';

import 'package:laza_ecommerce/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const BASE_URL = "https://fakestoreapi.com";

  Future<List<Product>> getProducts() async{
    final response = await http.get(Uri.parse('$BASE_URL/products'));

    if(response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e)=> Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Product> getProductById(int id) async {
    final response = await http.get(Uri.parse('$BASE_URL/products/$id'));

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Product.fromJson(data);
    }else {
      throw Exception('Failed to load data by id');
    }
  }
}