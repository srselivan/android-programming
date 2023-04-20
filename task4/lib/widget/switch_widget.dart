import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  String _text = "on";
  bool _on = true;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
              _text,
            textScaleFactor: 1.3,
          ),
        ),
        Switch(
          onChanged: (value) {
            setState(() {
              _on = value;
              _text = _on ? "on" : "off";
            });
            print(_text);
          },
          value: _on,
        )
      ],
    );
  }
}