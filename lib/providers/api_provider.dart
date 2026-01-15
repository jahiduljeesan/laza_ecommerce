import 'package:flutter/foundation.dart';
import 'package:laza_ecommerce/models/product.dart';
import 'package:laza_ecommerce/services/api_service.dart';

class ApiProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  List<Product> _products = [];
  List<Product> get products  => _products;

  bool isLoading = false;

  Future<void> loadProduct() async{
    isLoading = true;
    notifyListeners();

    _products = await _apiService.getProducts().whenComplete(() {
      isLoading = false;
      notifyListeners();
    });

    debugPrint('Product List Check ${_products.length} ');
  }
}