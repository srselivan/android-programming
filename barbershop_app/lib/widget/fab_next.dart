import 'package:flutter/material.dart';

class FloatingActionButtonNext extends StatelessWidget {

  final void Function() onPressed;
  final String text;

  const FloatingActionButtonNext({Key? key, this.text = 'Далее', required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(text),
      icon: const Icon(Icons.keyboard_arrow_right_outlined),
    );
  }
}