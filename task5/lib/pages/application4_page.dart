import 'package:flutter/material.dart';

class Application4Page extends StatefulWidget {
  const Application4Page({Key? key}) : super(key: key);

  @override
  State<Application4Page> createState() => _Application4PageState();
}

class _Application4PageState extends State<Application4Page> {
  DateTime _selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application 4 Page'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("${_selectedDate.toLocal()}".split(' ')[0],),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Select date'),
              ),
            ],
          ),
        )
      )
    );
  }
}
