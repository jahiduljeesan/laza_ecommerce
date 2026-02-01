import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:laza_ecommerce/services/api_service.dart';
import 'package:laza_ecommerce/models/cart/cart_request.dart';
import 'package:laza_ecommerce/models/cart/cart_response.dart';

class CartProvider extends ChangeNotifier {
  late Box _cartBox;
  final ApiService _apiService = ApiService();

  bool isLoading = true;
  CartResponse? _cartResponse;

  CartResponse? get cartResponse => _cartResponse;

  Future<void> init() async {
    _cartBox = await Hive.openBox('cartBox');
    debugPrint("CartLength provider initilzed");
    notifyListeners();
    _syncCartInBackground();
  }

  List<CartProduct> get cartItems {
    if (!Hive.isBoxOpen('cartBox')) return [];
    return _cartBox.values
        .map((e) => CartProduct.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  void addItem(CartProduct item) {
    debugPrint("CartLength provider cart added");
    final existing = _cartBox.get(item.id);

    if (existing != null) {
      final cartItem =
      CartProduct.fromJson(Map<String, dynamic>.from(existing));
      cartItem.quantity += item.quantity;
      _cartBox.put(item.id, cartItem.toJson());
    } else {
      _cartBox.put(item.id, item.toJson());
    }

    notifyListeners();
    _syncCartInBackground();
  }

  void updateQuantity(int productId, bool increment) {
    final data = _cartBox.get(productId);
    if (data == null) return;

    final item = CartProduct.fromJson(Map<String, dynamic>.from(data));
    if (increment) {
      item.quantity++;
    } else if (item.quantity > 1) {
      item.quantity--;
    }

    _cartBox.put(productId, item.toJson());
    notifyListeners();
    _syncCartInBackground();
  }

  void deleteItem(int productId) {
    _cartBox.delete(productId);
    notifyListeners();
    _syncCartInBackground();
  }


  Future<void> _syncCartInBackground() async {
    debugPrint("CartLength provider cart is syncing");
    debugPrint("CartLength provider cart itemsLength ${cartItems.length}");
    if (!Hive.isBoxOpen('cartBox')) return;

    isLoading = true;
    notifyListeners();

    try {
      final request = CartRequest(
        userId: 1,
        cartBodyList: cartItems
            .map((e) => CartBody(id: e.id, quantity: e.quantity))
            .toList(),
      );

      _cartResponse = await _apiService.getCart(request);
    } catch (e) {
      debugPrint('Cart sync error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  int get totalItems => cartItems.fold(0, (sum, e) => sum + e.quantity);

  double get totalPrice =>
      _cartResponse?.total ?? cartItems.fold(0, (sum, e) => sum + e.price * e.quantity);
}

class CartProduct {
  int id;
  int quantity;
  double price;
  String title;

  CartProduct({
    required this.id,
    required this.quantity,
    this.price = 0,
    this.title = '',
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      quantity: json['quantity'],
      price: (json['price'] ?? 0).toDouble(),
      title: (json['title'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'price': price,
      'title': title,
    };
  }
}
