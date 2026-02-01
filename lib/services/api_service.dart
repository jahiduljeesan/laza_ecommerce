import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:laza_ecommerce/models/cart/cart_request.dart';
import 'package:laza_ecommerce/models/cart/cart_response.dart';
import 'package:laza_ecommerce/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const BASE_URL = "https://dummyjson.com";

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$BASE_URL/products'));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List list = decoded['products'];

      final List<Product> products = [];

      for (var item in list) {
        try {
          products.add(Product.fromJson(item));
        } catch (e) {
          debugPrint('Product parse error: $e');
        }
      }

      return products;
    } else {
      throw Exception('Failed to load products');
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

  Future<CartResponse> getCart(CartRequest cartRequest) async {
    final uri = Uri.parse('https://dummyjson.com/carts/add');

    final body = cartRequest.toJson();

    debugPrint('REQUEST BODY: ${jsonEncode(body)}');

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    debugPrint('STATUS CODE: ${response.statusCode}');
    debugPrint('RESPONSE BODY: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return CartResponse.fromJson(data);
    } else {
      throw Exception('Failed to load cart data');
    }
  }

}