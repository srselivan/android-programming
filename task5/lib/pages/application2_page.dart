import 'package:flutter/material.dart';

class Application2Page extends StatefulWidget {
  const Application2Page({Key? key}) : super(key: key);

  @override
  State<Application2Page> createState() => _Application2PageState();
}

class _Application2PageState extends State<Application2Page> {
  late Application2SecondPage? _secondPage = const Application2SecondPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application 2 Page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _secondPage ??= const Application2SecondPage();
              });
            },
            child: const Text('Append page')
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _secondPage = null;
              });
            },
            child: const Text('Remove page')
          ),
          ElevatedButton(
              onPressed: () {
                if (_secondPage != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => _secondPage!),
                  );
                }
              },
              child: const Text('To second page')
          ),
        ],
      )
    );
  }
}

class Application2SecondPage extends StatelessWidget {
  const Application2SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Backward')
          ),
        )
    );
  }
}