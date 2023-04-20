import 'package:flutter/material.dart';

class FiveSquaresPage extends StatelessWidget {
  final double size;

  const FiveSquaresPage({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5 Squares'),
      ),
      body: Row(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: size,
                height: size,
                color: Colors.red,
              ),
              Container(
                width: size,
                height: size,
                color: Colors.purple,
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                width: size,
                height: size,
                color: Colors.green,
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: size,
                height: size,
                color: Colors.blue,
              ),
              Container(
                width: size,
                height: size,
                color: Colors.black,
              ),
            ],
          )
        ],
      )
    );
  }
}