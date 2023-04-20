import 'package:flutter/material.dart';

class Application1Page extends StatelessWidget {
  late int _count;

  Application1Page(this._count);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application 1 Page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _count++;
              final result = Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Application1Page(_count))
              );
              _count = int.parse(result.toString());
            },
            child: const Text('Forward')
          ),
          ElevatedButton(
            onPressed: () {
              _count--;
              Navigator.pop(context, _count);
            },
            child: const Text('Backward')
          ),
          Text('Stack depth: ${_count}')
        ],
      )
    );
  }
}