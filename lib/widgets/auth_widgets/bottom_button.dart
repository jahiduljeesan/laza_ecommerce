import 'package:flutter/material.dart';
import 'package:laza_ecommerce/values/laza_colors.dart';
class BottomButton extends StatelessWidget {
  String label;

  BottomButton({
    super.key,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: LazaColors.primaryColor
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}
