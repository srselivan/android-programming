import 'package:barbershop_app/model/order_type.dart';
import 'package:barbershop_app/page/order_date_selector.dart';
import 'package:barbershop_app/widget/fab_next.dart';
import 'package:flutter/material.dart';

import '../model/order.dart';
import '../widget/create_route.dart';

class OrderTypeSelector extends StatefulWidget {
  final String number;

  const OrderTypeSelector({super.key, required this.number});

  @override
  OrderTypeSelectorState createState() => OrderTypeSelectorState();
}

class OrderTypeSelectorState extends State<OrderTypeSelector> {

  final List<OrderType> _ordersMen = [
    OrderType("Type A", 1000, const Duration(hours: 1, minutes: 10), true),
    OrderType("Type B", 2000, const Duration(hours: 0, minutes: 40), true),
    OrderType("Type C", 3000, const Duration(hours: 1, minutes: 0), true),
    OrderType("Type D", 4000, const Duration(hours: 0, minutes: 30), true),
    OrderType("Type E", 5000, const Duration(hours: 2, minutes: 0), true),
  ];

  final List<OrderType> _ordersWomen = [
    OrderType("Type AW", 1000, const Duration(hours: 2, minutes: 10), false),
    OrderType("Type BW", 2000, const Duration(hours: 3, minutes: 10), false),
    OrderType("Type CW", 3000, const Duration(hours: 1, minutes: 10), false),
    OrderType("Type DW", 4000, const Duration(hours: 0, minutes: 10), false),
    OrderType("Type EW", 5000, const Duration(hours: 0, minutes: 20), false),
  ];

  int _selected = -1;
  bool _isWomen = false;
  Order order = Order(
    OrderType("Type A", 1000, const Duration(hours: 1, minutes: 10), true),
    DateTime.now(),
    TimeOfDay.now(),
    ""
  );

  @override
  Widget build(BuildContext context) {
    order.number = widget.number;

    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButtonNext(
          onPressed: () {
            Navigator.of(context).push(createRoute(OrderDateSelector(order: order)));
          },
        ),
        body: Column(
          children: [
            const Text('Men'),
            Flexible(
              child: ListView.builder(
                itemCount: _ordersMen.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        _selected = i;
                        _isWomen = false;
                        order.type = _ordersMen[_selected];
                      });
                    },
                    title: Text(_ordersMen[i].name),
                    subtitle: Text('${_ordersMen[i].cost}rub. \t${_ordersMen[i].duration.inHours}h.${_ordersMen[i].duration.inMinutes % 60}min.'),
                    selectedTileColor: Colors.green[100],
                    selected: _selected == i && !_isWomen,
                  );
                },
              ),
            ),
            const Text('Women'),
            Flexible(
              child: ListView.builder(
                itemCount: _ordersWomen.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        _selected = i;
                        _isWomen = true;
                        order.type = _ordersWomen[_selected];
                      });
                    },
                    title: Text(_ordersWomen[i].name),
                    subtitle: Text('${_ordersWomen[i].cost}rub. \t${_ordersWomen[i].duration.inHours}h.${_ordersWomen[i].duration.inMinutes % 60}min.'),
                    selected: _selected == i && _isWomen,
                    selectedTileColor: Colors.green[100],
                  );
                },
              ),
            )
          ],
        )
    );
  }
}