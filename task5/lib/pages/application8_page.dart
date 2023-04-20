import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Application8Page extends StatefulWidget {
  const Application8Page({super.key});

  @override
  State<Application8Page> createState() => _Application8PageState();
}

class _Task {
  final String _name;
  final DateTime _date;

  _Task(this._name, this._date);
  String get name => _name;
  DateTime get date => _date;
}

class _Application8PageState extends State<Application8Page> {
  List<_Task> _tasks() => [
        _Task('task1', DateTime(2023, 2, 2)),
        _Task('task2', DateTime(2023, 2, 2)),
        _Task('task3', DateTime(2023, 5, 4)),
        _Task('task4', DateTime(2023, 5, 4)),
        _Task('task5', DateTime(2023, 6, 2)),
        _Task('task6', DateTime(2023, 2, 5)),
      ];

  @override
  Widget build(BuildContext context) {
    _tasks().sort((a, b) => a._date.compareTo(b._date));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Application 8 Page'),
        ),
        body: PageView.builder(
            itemCount: _tasks().length,
            itemBuilder: (context, i) {
              return Container(
                  margin: EdgeInsets.all(10),
                  color: CupertinoColors.extraLightBackgroundGray,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_tasks()[i]._name}',
                        textScaleFactor: 2.5,
                      ),
                      Text('${_tasks()[i]._date}'.split(' ')[0])
                    ],
                  )
              );
            }
        )
    );
  }
}
