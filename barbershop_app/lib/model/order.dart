import 'package:flutter/material.dart';

import 'order_type.dart';

class Order {
  late OrderType _type = OrderType("", -1, const Duration(hours: 0), true);
  late DateTime _date = DateTime(2023);
  late TimeOfDay _time = TimeOfDay.now();
  late String number = "";

  Order(this._type, this._date, this._time, this.number);

  OrderType get type => _type;

  set type(OrderType value) {
    _type = value;
  }

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  TimeOfDay get time => _time;

  set time(TimeOfDay value) {
    _time = value;
  }
}