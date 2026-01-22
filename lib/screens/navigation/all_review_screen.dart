import 'package:flutter/material.dart';
import 'package:laza_ecommerce/models/product.dart';
import 'package:laza_ecommerce/models/review.dart';

import '../../widgets/styles/product_review_style.dart';

class AllReviewScreen extends StatelessWidget {
  final Product? product;

  const AllReviewScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final reviews = product!.reviews;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Reviews'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              spacing: size.width * 0.02,
              children: [
                Text(
                  _rating().toStringAsFixed(2),
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(.8),
                  ),
                ),

                Row(
                  children: List.generate(5, (index) {
                    if (index + 1 <= product!.rating) {
                      return const Icon(Icons.star, size: 18, color: Colors.amber);
                    } else if (index + .5 <= product!.rating) {
                      return const Icon(
                        Icons.star_half,
                        size: 18,
                        color: Colors.amber,
                      );
                    } else {
                      return const Icon(
                        Icons.star_border,
                        size: 18,
                        color: Colors.amber,
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.02),
        child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context,index){
              return product == null ? Center()
                  : ProductReviewStyle(review: product!.reviews[index]);
            },
            separatorBuilder: (context,index){
              return SizedBox(height: size.height * .015,);
            },
            itemCount: product!.reviews.length
        ),
      ),
    );
  }
  
  double _rating(){
    var sum = 0.0;

    for(var val in product!.reviews) {
      sum = sum + val.rating;
    }

    return sum/product!.reviews.length;
  }
}
