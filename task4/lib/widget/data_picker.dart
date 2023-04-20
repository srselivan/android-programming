import 'package:flutter/material.dart';

class DataPicker extends StatefulWidget {
  const DataPicker({super.key});

  @override
  State<DataPicker> createState() => _DataPickerState();
}

class _DataPickerState extends State<DataPicker> {
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
      print(_selectedDate);
    }
  }

  @override
  Widget build(BuildContext context){
    return Column(
        children: [
          Text("${_selectedDate.toLocal()}".split(' ')[0],),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: const Text('Select date'),
          ),
        ],
    );
  }
}