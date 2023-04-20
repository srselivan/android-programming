import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (_isPressed) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.5);
            }
              return null;
          },
        ),
      ),
      onPressed: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: const Text(
        'Button',
        textScaleFactor: 1.3,
      ),
    );
  }
}