import 'package:flutter/material.dart';

class Application3Page extends StatefulWidget {
  const Application3Page({Key? key}) : super(key: key);

  @override
  State<Application3Page> createState() => _Application3PageState();
}

class _Application3PageState extends State<Application3Page> {
  String _message = "";
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Application 3 Page'),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text('${_message}'),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: TextField(
                              controller: _controller,
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _message = _controller.text;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('get text field'),
                ),
              ),
            ],
          ),
        )
    );
  }
}
