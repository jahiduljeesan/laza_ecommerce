import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartStyle extends StatefulWidget {
  const CartStyle({super.key});

  @override
  State<CartStyle> createState() => _CartStyleState();
}

class _CartStyleState extends State<CartStyle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png',
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mens Tie-Dye T-Shirt Nike Sportswere',
                    maxLines: 2,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\$ 45',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black.withOpacity(.6),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _circulerButton(
                              onTap: () {},
                              iconData: Icons.expand_more,
                              iconSize: 25,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              '1',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black.withOpacity(.6),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            _circulerButton(
                              onTap: () {},
                              iconData: Icons.expand_less,
                              iconSize: 25,
                            ),
                          ],
                        ),
                        _circulerButton(
                          onTap: () {},
                          iconData: Icons.delete_outline,
                          iconSize: 28,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell _circulerButton({
    required VoidCallback onTap,
    required IconData iconData,
    required double iconSize,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: iconSize,
        width: iconSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: Colors.grey.shade400),
        ),
        child: Icon(iconData, size: 22, color: Colors.grey),
      ),
    );
  }
}
