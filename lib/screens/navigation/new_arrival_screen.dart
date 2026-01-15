import 'package:flutter/material.dart';
import 'package:laza_ecommerce/models/product.dart';
import 'package:laza_ecommerce/screens/navigation/product_detail_screen.dart';
import 'package:laza_ecommerce/widgets/styles/product_style.dart';
class NewArrivalScreen extends StatefulWidget {

  final List<Product> products;

  const NewArrivalScreen({super.key,required this.products});

  @override
  State<NewArrivalScreen> createState() => _NewArrivalScreenState();
}

class _NewArrivalScreenState extends State<NewArrivalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('New Arrivals',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: widget.products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: .59,
          ),
          itemBuilder: (context,index) {
            return ProductStyle(product: widget.products[index],
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (_) => ProductDetailScreen(productId:  widget.products[index].id ?? 0 ,),
              )),
            );
          }
      ),
    );
  }
}
