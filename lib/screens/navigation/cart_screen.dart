import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza_ecommerce/providers/cart_provider.dart';
import 'package:laza_ecommerce/values/laza_colors.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/title_text.dart';
import 'package:laza_ecommerce/widgets/styles/cart_style.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../widgets/auth_widgets/bottom_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<CartProvider>(
        builder: (context, cart, _) {
          debugPrint("CartLength Cart Page: ${cart.cartItems.length}");
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cart.cartResponse?.totalProducts ?? 0,
                itemBuilder: (context, index) {
                  final cartProduct = cart.cartResponse?.products[index];
                  return CartStyle(
                    cartItem: cartProduct,
                    onDecrease: () =>
                        cart.updateQuantity(cartProduct?.id ?? 0, false),
                    onIncrease: () =>
                        cart.updateQuantity(cartProduct?.id ?? 0, true),
                    onDelete: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            icon: Image.asset(
                              'assets/icons/laza_logo.png',
                              color: LazaColors.primaryColor,
                              height: 25,
                              width: 25,
                            ),
                            title: Text('Do you really want to delete?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: LazaColors.primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  cart.deleteItem(cartProduct?.id ?? 0);
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Okay',
                                  style: TextStyle(
                                    color: LazaColors.primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: size.height * .004,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Order Info',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          _subtitleRow(
                            label: 'Subtotal',
                            value: '${cart.cartResponse?.total.toStringAsFixed(2)} BDT',
                          ),
                          _subtitleRow(
                            label: 'Discounted Total',
                            value: '${cart.cartResponse?.discountedTotal.toStringAsFixed(2)} BDT',
                          ),
                          _subtitleRow(
                            label: 'Shipping Charge',
                            value: '${cart.cartResponse?.totalProducts} x 100 BDT',
                          ),
                          _subtitleRow(
                            label: 'Subtotal',
                            value: '${(cart.totalPrice + cart.totalItems*100).toStringAsFixed(2)} BDT',
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 60,
                    child: BottomButton(
                      label: 'Checkout',
                      onTap: () {},
                    ),
                  ),
                ],
              )

            ],
          );
        },
      ),
    );
  }

  Row _subtitleRow({required String label,
    required String value,
    int fontSize = 13,FontWeight fontWeight = FontWeight.normal}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 13,fontWeight: fontWeight)
        ,),
        Text(value, style: TextStyle(fontSize: 13,fontWeight: fontWeight)
          ,),
      ],
    );
  }
}
