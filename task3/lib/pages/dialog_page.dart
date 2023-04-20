import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  late TextEditingController _controller4;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dialog Page'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: _controller1,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: _controller2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: _controller3,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: _controller4,
              ),
            ),
            TextButton(
              onPressed: () {
                _controller1.clear();
                _controller2.clear();
                _controller3.clear();
                _controller4.clear();
              },
              child: Text("Cancel"),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    print(int.parse(_controller1.text) +
                        int.parse(_controller2.text) + int.parse(_controller3.text) +
                        int.parse(_controller4.text));
                  },
                  child: Text("+"),
                ),
                TextButton(
                  onPressed: () {
                    print(int.parse(_controller1.text) -
                        int.parse(_controller2.text) - int.parse(_controller3.text) -
                        int.parse(_controller4.text));
                  },
                  child: Text("-"),
                ),
                TextButton(
                  onPressed: () {
                    print(int.parse(_controller1.text) *
                        int.parse(_controller2.text) * int.parse(_controller3.text) *
                        int.parse(_controller4.text));
                  },
                  child: Text("*"),
                ),
                TextButton(
                  onPressed: () {
                    final result = int.parse(_controller1.text) /
                        int.parse(_controller2.text) / int.parse(_controller3.text) /
                        int.parse(_controller4.text);
                    print( result == double.infinity ? 'error: devide by zero' : result);
                  },
                  child: Text("/"),
                ),
              ],
            )
          ],
        ));
  }
}
