import 'package:flutter/material.dart';

class App5 extends StatefulWidget {
  const App5({Key? key}) : super(key: key);

  @override
  State<App5> createState() => _App5State();
}

class _Component extends StatelessWidget {
  final Color _color;
  Text textWidget = const Text('some data');

  _Component(this._color);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textWidget,
        ElevatedButton(
            onPressed: () {},
            child: Text(
              textWidget.data ?? "no data",
              style: TextStyle(color: _color),
            )
        )
      ],
    );
  }
}

class _App5State extends State<App5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Application 5 Page'),
        ),
        body: Center(
          child: _Component(Colors.purple),
        ));
  }
}
