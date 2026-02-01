import 'package:flutter/foundation.dart';
import 'package:laza_ecommerce/models/cart/cart_request.dart';
import 'package:laza_ecommerce/models/cart/cart_response.dart';
import 'package:laza_ecommerce/models/product.dart';
import 'package:laza_ecommerce/services/api_service.dart';

class ApiProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  List<Product> _products = [];
  List<Product> get products  => _products;

  Product? _product;
  Product? get product  => _product;

  CartResponse? _cartResponse;
  CartResponse? get cartResponse => _cartResponse;

  bool isLoading = false;

  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      _products = await _apiService.getProducts();
    } catch (e) {
      debugPrint('Error loading products: $e');
    }finally{
      isLoading = false;
      notifyListeners();
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

  Future<void> loadAllCart(List<CartBody> cartsBodyList) async{
    isLoading = true;
    notifyListeners();

    _cartResponse = await _apiService.getCart(
      CartRequest(
          userId: 1,
          cartBodyList: cartsBodyList)
    ).whenComplete((){
      isLoading =false;
      notifyListeners();
    });


  }

  void clearProduct() {
    _product = null;
    notifyListeners();
  }
}