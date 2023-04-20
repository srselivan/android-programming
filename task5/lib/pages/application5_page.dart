import 'package:flutter/material.dart';

class Application5Page extends StatefulWidget {
  const Application5Page({super.key});

  @override
  State<Application5Page> createState() => _Application5PageState();
}

class _Application5PageState extends State<Application5Page> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  _selectDate(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
    );
    if (picked != null && picked != _timeOfDay) {
      setState(() {
        _timeOfDay = picked;
      });
      print(_timeOfDay);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Application 5 Page'),
        ),
        body: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(_timeOfDay.format(context)),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: const Text('Select time'),
                  ),
                ],
              )
            )
        )
    );
  }
}