import 'package:flutter/material.dart';

class MasterLoginButton extends StatelessWidget {
  String imagePath;
  String label;
  Color color;
  VoidCallback? onTap;

  MasterLoginButton({super.key,
    required this.imagePath,
    required this.label,
    required this.color,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
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
      ),
    );
  }
}
