import 'package:flutter/material.dart';

class TransformPage extends StatelessWidget {
  final double size = 100;
  
  const TransformPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transform Page'),
      ),
      body: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: size,
            height: size,
            color: Colors.black,
          ),
          Transform.rotate(
            angle: 1.0,
            child: Transform.scale(
              scaleX: 0.5,
              child: Container(
                margin: EdgeInsets.all(10),
                width: size,
                height: size,
                color: Colors.black,
              ),
            ),
          ),
        ],
      )
    );
  }
}