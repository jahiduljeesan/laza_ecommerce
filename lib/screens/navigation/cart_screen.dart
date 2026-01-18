import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/title_text.dart';

import '../../values/laza_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Center(
                child: Text(
                  'Cart',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),

            

          ],
        ),
      ),
    );
  }
}
