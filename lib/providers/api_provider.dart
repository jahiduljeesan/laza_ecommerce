import 'package:flutter/foundation.dart';
import 'package:laza_ecommerce/models/product.dart';
import 'package:laza_ecommerce/services/api_service.dart';

class ApiProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  List<Product> _products = [];
  List<Product> get products  => _products;

  Product? _product;
  Product? get product  => _product;

  bool isLoading = false;

  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      _products = await _apiService.getProducts();
      debugPrint("Loaded productsx: ${_products.length}");
    } catch (e) {
      debugPrint('Error loading products: $e');
    } finally {
      isLoading = false;
      notifyListeners();
      debugPrint("Loaded productsx: ${_products.length}");
    }
  }


  Future<void> loadProductById(int id) async {
    isLoading = true;
    notifyListeners();
    _product = await _apiService.getProductById(id).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }

  void clearProduct() {
    _product = null;
    notifyListeners();
  }
}