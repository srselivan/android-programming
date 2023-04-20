import 'package:flutter/material.dart';
import 'package:colornames/colornames.dart';

class RectangleList extends StatefulWidget {
  const RectangleList({Key? key}) : super(key: key);

  @override
  State<RectangleList> createState() => _RectangleListState();
}

class _Item {
  late Color _containerColor;
  late Color _textColor;
  late String _text = ColorNames.guess(_containerColor);

  _Item(this._containerColor, this._textColor);

  String get text => _text;
  Color get textColor => _textColor;
  Color get containerColor => _containerColor;
}

class _RectangleListState extends State<RectangleList> {
  List<_Item> _items = [
    _Item(Colors.black, Colors.white),
    _Item(Colors.white, Colors.black),
    _Item(Colors.blue, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Application 1 Page'),
        ),
        body: SizedBox(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, i) {
              return Container(
                height: 80,
                color: _items[i].containerColor,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    _items[i].text,
                    style: TextStyle(
                      color: _items[i].textColor,
                      fontSize: 17.0
                    ),
                  ),
                )
              );
            },
          ),
        )
    );
  }
}