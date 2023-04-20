import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Application6Page extends StatefulWidget {
  const Application6Page({super.key});

  @override
  State<Application6Page> createState() => _Application6PageState();
}

class _Task {
  final String _name;
  final DateTime _date;

  _Task(this._name, this._date);
  String get name => _name;
  DateTime get date => _date;
}

class _Application6PageState extends State<Application6Page> {
  List<_Task> _tasks() => [
    _Task('task1', DateTime(2023, 2, 2)),
    _Task('task2', DateTime(2023, 2, 2)),
    _Task('task3', DateTime(2023, 5, 4)),
    _Task('task4', DateTime(2023, 5, 4)),
    _Task('task5', DateTime(2023, 6, 2)),
    _Task('task6', DateTime(2023, 2, 5)),
  ];

  @override
  Widget build(BuildContext context){
    var group = groupBy(_tasks(), (m) => m.date);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Application 6 Page'),
        ),
        body: ListView.builder(
          itemCount: group.keys.length,
          itemBuilder: (BuildContext context, int i) {
            DateTime key = group.keys.elementAt(i);
            var children = group[key]!.map((e) => Container(
              child: Text(e.name),
              margin: EdgeInsets.all(5),
            )).toList();
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 5),
                  child: Text("${key.toLocal()}".split(' ')[0]),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                )
              ],
            );
          },
          padding: const EdgeInsets.all(8)
        )
    );
  }
}