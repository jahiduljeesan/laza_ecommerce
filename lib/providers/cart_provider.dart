import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:laza_ecommerce/models/cart/cart_request.dart';
import 'package:laza_ecommerce/models/cart/cart_response.dart';
import 'package:laza_ecommerce/services/api_service.dart';

class CartProvider extends ChangeNotifier {
  late Box _cartBox;
  final _apiService = ApiService();
  bool isLoading = false;

  late CartResponse _cartResponse;
  CartResponse get cartResponse  => _cartResponse;

  CartProvider() {
    _init();
  }

  Future<void> _init() async{
    _cartBox = await Hive.openBox('cartBox');
    notifyListeners();
  }

  Future<void> loadData() async{
    isLoading = true;
    notifyListeners();

    try {
      _cartResponse = await _apiService.getCart(
        CartRequest(
            userId: 5, cartBodyList: cartItems
        )
      );
      isLoading = false;
    } catch (e){
      debugPrint('e: $e');
    }
  }

  List<CartBody> get cartItems =>
      _cartBox.values.map((e) => CartBody.fromJson(Map<String,dynamic>.from(e))).toList();

  void addItem(CartBody cartItem) {
    final index = cartItems.indexWhere((e) => e.id == cartItem.id);

    if(index != -1) {
      cartItems[index].quantity += cartItem.quantity;
      _cartBox.putAt(index, cartItem.toJson());
    }
     else {
       _cartBox.add(cartItem.toJson());
    }
     notifyListeners();
  }

  void updateQuantity(bool isIncrementing,int cartId) {
    final index = cartItems.indexWhere((e) => e.id == cartId);

    if(isIncrementing){
      cartItems[index].quantity ++;
      _cartBox.putAt(index, cartItems[index].toJson());
    } else {
      cartItems[index].quantity --;
      _cartBox.putAt(index, cartItems[index].toJson());
    }

    notifyListeners();
  }

  void deleteItem(int productId) {
    final index = cartItems.indexWhere((e) => e.id == productId);
    if (index != -1) {
      _cartBox.deleteAt(index);
      notifyListeners();
    }
  }


}