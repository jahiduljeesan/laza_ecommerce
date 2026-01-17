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

  Future<void> loadProducts() async{
    debugPrint('Product List Check ${_products.length} ');
    isLoading = true;
    notifyListeners();

    _products = await _apiService.getProducts().whenComplete(() {
      isLoading = false;
      debugPrint('Product List Check ${_products.length} ');
      notifyListeners();
    });
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