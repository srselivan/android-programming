
class OrderType {
  late String _name;
  late int _cost;
  late Duration _duration;
  late bool _isMale;

  OrderType(this._name, this._cost, this._duration, this._isMale);

  Duration get duration => _duration;

  set duration(Duration value) {
    _duration = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get cost => _cost;

  bool get isMale => _isMale;

  set isMale(bool value) {
    _isMale = value;
  }

  set cost(int value) {
    _cost = value;
  }
}