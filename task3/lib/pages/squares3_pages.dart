import 'package:flutter/material.dart';

class ThreeSquaresPage extends StatelessWidget {
  final double size;

  const ThreeSquaresPage({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3 Squares'),
      ),
      body: Row(
        children: [
          Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(0, 0),
                child: Container(
                  width: size,
                  height: size,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset: Offset(size, size / 2),
                child: Container(
                  width: size,
                  height: size,
                  color: Colors.green,
                ),
              ),
              Transform.translate(
                offset: Offset(size * 1.5, 0),
                child: Container(
                  width: size,
                  height: size,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      "Квадрат",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}