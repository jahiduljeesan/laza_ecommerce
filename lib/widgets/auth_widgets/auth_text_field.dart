import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  String title;
  String hint;
  TextEditingController? controller;

   AuthTextField({super.key,
    required this.title,
     required this.hint,
     this.controller
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade800
            ),
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hint: Text(hint,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                  fontSize: 17
                ),
                 ),
            ),
          ),
        ],
      ),
    );
  }
}
