import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza_ecommerce/providers/cart_provider.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/title_text.dart';
import 'package:laza_ecommerce/widgets/styles/cart_style.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return FutureBuilder(
      future: cartProvider.init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cart.cartItems.length,
                      itemBuilder: (context, index) {
                        return CartStyle(
                          // pass item here if needed
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

}
