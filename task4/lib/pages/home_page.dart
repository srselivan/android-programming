import 'package:flutter/material.dart';
import 'package:task4/widget/counter_button.dart';
import 'package:task4/widget/custom_button.dart';
import 'package:task4/widget/custom_text_field.dart';
import 'package:task4/widget/data_picker.dart';
import 'package:task4/widget/dropdown_button.dart';
import 'package:task4/widget/pressed_button.dart';
import 'package:task4/widget/slider_widget.dart';
import 'package:task4/widget/switch_widget.dart';
import 'package:task4/widget/time_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Home page")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: CustomTextField(),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: CustomButton(),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: PressedButton(),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: CounterButton(),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: DataPicker(),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: TimePicker(),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: DropDownButton(),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: SwitchWidget(),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: SliderWidget(),
            ),
          ],
        ),
      )
    );
  }

}