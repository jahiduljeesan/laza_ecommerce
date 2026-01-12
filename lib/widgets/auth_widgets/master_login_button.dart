import 'package:flutter/material.dart';

class MasterLoginButton extends StatelessWidget {
  String imagePath;
  String label;
  Color color;

  MasterLoginButton({super.key,
    required this.imagePath,
    required this.label,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          SizedBox(width: 10),
          Text(label, style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
          ),
        ],
      ),
    );
  }
}
