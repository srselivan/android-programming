import 'package:flutter/material.dart';

class OrdersHistory extends StatefulWidget {
  const OrdersHistory({super.key});

  @override
  OrdersHistoryState createState() => OrdersHistoryState();
}

class _Order {
  final _date;
  final _name;
  final _coast;

  _Order(this._date, this._name, this._coast);

  get coast => _coast;

  get name => _name;

  get date => _date;
}

class OrdersHistoryState extends State<OrdersHistory> {
  final List<_Order> _orders = [
    _Order("17.02.22", 'Type A', 2000),
    _Order("17.02.22", 'Type A', 2000),
    _Order("17.02.22", 'Type A', 2000),
    _Order("17.02.22", 'Type A', 2000),
    _Order("17.02.22", 'Type A', 2000),
    _Order("17.02.22", 'Type A', 2000),
    _Order("17.02.22", 'Type A', 2000),
    _Order("17.02.22", 'Type A', 2000),
    _Order("17.02.22", 'Type A', 2000),
    _Order("17.02.22", 'Type A', 2000),
    _Order("17.02.22", 'Type A', 2000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: _orders.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(_orders[index]._date),
                subtitle: Text(_orders[index]._name + ', ${_orders[index]._coast}rub.'),
              ),
            );
          },
        )
    );
  }
}