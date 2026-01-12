import 'package:flutter/material.dart';
class ToTextButton extends StatelessWidget {
  String directionText;
  String buttonText;
  VoidCallback callback;

  ToTextButton({super.key,
    required this.directionText,
    required this.buttonText,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
         directionText,
          style: TextStyle(
            color: Colors.black.withOpacity(.7),
            fontSize: 17
          ),
        ),
        TextButton(
            onPressed: callback,
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                decoration: TextDecoration.underline
              ),
            )
        )
      ],
    );
  }
}
