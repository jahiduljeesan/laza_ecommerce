import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:laza_ecommerce/models/rating.dart';
import 'package:laza_ecommerce/models/review.dart';

class ProductReviewStyle extends StatelessWidget {
  final Review? review;

  const ProductReviewStyle({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review?.reviewerName ?? 'null',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(.7),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 14,
                      color: Colors.black.withOpacity(.6),
                    ),
                    SizedBox(width: size.width * .01),
                    Text(
                      (review?.date ?? 'null').toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                Row(
                  children: [
                    Text(
                      '4.5',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(.8),
                      ),
                    ),
                    Text(
                      ' review',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(.6),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: List.generate(5, (index) {
                    if (index + 1 <= review!.rating) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      );
                    } else if (index + 0.5 <= review!.rating) {
                      return const Icon(
                        Icons.star_half,
                        color: Colors.amber,
                        size: 16,
                      );
                    } else {
                      return const Icon(
                        Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      );
                    }
                  }),
                ),
              ],
            ),
          ],
        ),

        ExpandableText(
          review?.comment ?? 'No Comment',
          expandText: 'show more',
          collapseText: 'show less',
          maxLines: 3,
          linkColor: Colors.blue,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
            height: 1.4,
          ),
          animation: true,
        ),
      ],
    );
  }
}
