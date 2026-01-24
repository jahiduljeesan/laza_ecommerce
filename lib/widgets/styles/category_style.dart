import 'package:flutter/material.dart';

class CategoryStyle extends StatelessWidget {
  final Map<String,String> category;

  const CategoryStyle({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    var entry = category.entries.first;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 6),
      width: 130,
      height: 70,
      decoration: BoxDecoration(
       color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        spacing: 8,
        children: [
          Container(
            height: 45,
            width: 45,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Image.asset(
              entry.value
            ),
          ),
          Expanded(
            child: Text(
              entry.key,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500
              ),
            ),
          )
        ],
      ),
    );
  }
}
