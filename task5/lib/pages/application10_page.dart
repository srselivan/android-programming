import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Application10Page extends StatefulWidget {
  const Application10Page({super.key});

  @override
  State<Application10Page> createState() => _Application10PageState();
}

class _Application10PageState extends State<Application10Page> {
  static const List<String> _choices = <String>[
    "Item 1",
    "Item 2",
    "Item 3",
  ];

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  String _selectedString = "";
  String _selectedIndex = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Application 8 Page'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  _selectedString = _choices[int.parse(value)];
                  _selectedIndex = value;
                });
              },
              itemBuilder: (context) {
                return _choices.map((e) {
                  return PopupMenuItem<String>(
                    value: _choices.indexOf(e).toString(),
                    child: Text(e),
                  );
                },).toList();
              },
            )
          ],
        ),
        body: Align(
          alignment: Alignment.center,
          child: Center(
            child: Text(_selectedString + "\n" + _selectedIndex),
          ),
        )
    );
  }
}
