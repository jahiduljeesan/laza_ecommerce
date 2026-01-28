import 'package:flutter/material.dart';
class RememberSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  RememberSwitch({
    super.key,
    required this.value,
    required this.onChanged,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Remember me',
            style: TextStyle(
              fontSize: 18
            ),
          ),
          Transform.scale(
            scale: .8,
            child: Switch(
                value: value,
                onChanged: (val) => onChanged(val),
              activeTrackColor: Colors.green,
              activeThumbColor: Colors.white,
              inactiveTrackColor: Colors.white,
              inactiveThumbColor: Colors.green,
              trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
              trackOutlineWidth: WidgetStatePropertyAll(0.0),
            ),
          )


        ],
      ),
    );
  }
}
