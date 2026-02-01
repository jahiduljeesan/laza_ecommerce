import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:laza_ecommerce/models/product.dart';
import 'package:laza_ecommerce/providers/api_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
class ProductStyle extends StatelessWidget {

  final Product? product;
  final VoidCallback onTap;

  const ProductStyle({super.key, required this.product,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15)
            ,topRight: Radius.circular(15)
        ),
        child: SizedBox(
          height: 300,
          child: Column(
                children: [
                  //Image container
                  Stack(
                    children:[
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SizedBox(
                            height: 200,
                            child: CachedNetworkImage(
                              imageUrl: product?.images.first ?? '',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Image.asset('assets/icons/ic_heart.png'),
                      )
                    ]
                  ),
                  const SizedBox(height: 5,),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                        child: Text(
                          maxLines: 2,
                            product?.title??'No title found!',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                        '\$${product?.price.toString() ?? '0'}',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
        ),
            //fav button
      ),
    );
  }
}
