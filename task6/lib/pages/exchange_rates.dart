import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExchangeRates extends StatefulWidget {
  const ExchangeRates({Key? key}) : super(key: key);

  @override
  State<ExchangeRates> createState() => _ExchangeRatesState();
}

class _ExchangeRatesState extends State<ExchangeRates> {
  List _values = [];

  void _xmlData() async {
    final dataList = [];
    //var url = Uri.parse('https://www.cbr-xml-daily.ru/daily_utf8.xml');
    var url = Uri.https('cbr-xml-daily.ru', 'daily_utf8.xml');
    var response = await http.get(url);
    //var body = response.bodyBytes;
    var body = utf8.decode(response.bodyBytes);

    //print(body);
    final document = xml.XmlDocument.parse(body);
    final valCursNode = document.findElements('ValCurs').first;
    final valuteNode = valCursNode.findElements('Valute');

    for (final valute in valuteNode) {
      final CharCode = valute.findElements('CharCode').first.text;
      final Value = valute.findElements('Value').first.text;
      final Name = valute.findElements('Name').first.text;
      dataList.add({'code': CharCode, 'value': Value, 'name': Name});
    }

    setState(() {
      _values = dataList;
    });
  }

  @override
  void initState() {
    super.initState();
    _xmlData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Application 3 Page'),
        ),
        body: SizedBox(
          child: ListView.builder(
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(_values[index]['code'] + ' '+ _values[index]['name']),
                subtitle: Text("Value: ${_values[index]['value']}"),
              ),
            ),
            itemCount: _values.length,
          ),
        )
    );
  }
}