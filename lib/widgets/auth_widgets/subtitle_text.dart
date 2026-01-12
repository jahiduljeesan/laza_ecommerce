import 'package:flutter/material.dart';
class SubtitleText extends StatelessWidget {
  String text;

  SubtitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 13,
        color: Colors.black.withOpacity(0.55),
        height: 1.35,
      ),
      textAlign: TextAlign.center,
    );
  }
}
