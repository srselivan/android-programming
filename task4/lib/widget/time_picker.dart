import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  TimeOfDay _timeOfDay2 = TimeOfDay.now();
  TimeOfDay _timeOfDayRes = TimeOfDay.now();

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
      _getDiff();
    }
  }

  _selectDate2(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay2,
    );
    if (picked != null && picked != _timeOfDay2) {
      setState(() {
        _timeOfDay2 = picked;
      });
      print(_timeOfDay2);
      _getDiff();
    }
  }

  void _getDiff() {
    _timeOfDayRes = TimeOfDay(
        hour: _timeOfDay.hour - _timeOfDay2.hour > 0 ? _timeOfDay.hour - _timeOfDay2.hour : _timeOfDay2.hour - _timeOfDay.hour, 
        minute: _timeOfDay.minute - _timeOfDay2.minute > 0 ? _timeOfDay.minute - _timeOfDay2.minute : _timeOfDay2.minute - _timeOfDay.minute,
    );
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Text(_timeOfDay.format(context)),
        ElevatedButton(
          onPressed: () => _selectDate(context),
          child: const Text('Select time'),
        ),

        Text(_timeOfDay2.format(context)),
        ElevatedButton(
          onPressed: () => _selectDate2(context),
          child: const Text('Select time'),
        ),

        Container(
          margin: EdgeInsets.only(top: 30, bottom: 30),
          child: Text(_timeOfDayRes.format(context)),
        )
      ],
    );
  }
}