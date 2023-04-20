import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  final double size;

  const GridPage({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Page'),
      ),
      body: GridView.count(
          crossAxisCount: 3,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: size,
              height: size,
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: size,
              height: size,
              color: Colors.green,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: size,
              height: size,
              color: Colors.blue,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: size,
              height: size,
              color: Colors.purple,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: size,
              height: size,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: size,
              height: size,
              color: Colors.black,
            ),
          ],
      )
    );
  }
}