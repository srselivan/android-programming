import 'package:flutter/material.dart';

class PressedButton extends StatefulWidget {
  const PressedButton({super.key});

  @override
  State<PressedButton> createState() => _PressedButtonState();
}

class _PressedButtonState extends State<PressedButton> {
  String _onPressedText = "Not Pressed";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Text(
          _onPressedText,
          textScaleFactor: 1.4,
        ),
      ),
      TextButton(
        onPressed: () {},
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
        ),
        child: GestureDetector(
            onTapUp: (details) {
              setState(() {
                _onPressedText = "Not Pressed";
              });
            },
            onTapDown: (details) {
              setState(() {
                _onPressedText = "Pressed";
              });
            },
            child: Container(
              padding: EdgeInsets.all(0),
              child: const Text(
                'Button',
                textScaleFactor: 1.3,
              ),
            )),
      ),
    ]);
  }
}
