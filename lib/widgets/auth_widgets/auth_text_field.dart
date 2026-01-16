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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600
            ),
          ),
          //delete able comment s
          TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE7E8EA)), // Default (unfocused) border color
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black), // Border color when focused
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red), // When error
              ),
              hint: Text(hint,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
                 ),
            ),
          ),
        ],
      ),
    );
  }
}
