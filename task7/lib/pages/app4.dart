import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

class App4 extends StatelessWidget {
  const App4({super.key});

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
                  context.read<Counter>().increment();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => App4())
                  );
                },
                child: const Text('Forward')
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<Counter>().decrement();
                  Navigator.pop(context);
                },
                child: const Text('Backward')
            ),
            Text('Stack depth: ${context.watch<Counter>().count}')
          ],
        )
    );
  }
}