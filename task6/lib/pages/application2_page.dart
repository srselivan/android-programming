import 'package:flutter/material.dart';
import 'package:colornames/colornames.dart';

class Application2Page extends StatefulWidget {
  const Application2Page({Key? key}) : super(key: key);

  @override
  State<Application2Page> createState() => _Application2PageState();
}

class _Item {
  late int _i;

  _Item(this._i);

  int get i => _i;
}

class _Application2PageState extends State<Application2Page> {
  List<_Item> _items = List<_Item>.generate(2, (i) => _Item(i));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Application 1 Page'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _items.insert(_items.length, _Item(_items.length));
                    });
                  },
                  child: Text('Append')
              ),
              SizedBox(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _items.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            _items.removeAt(0);
                          });
                        },
                        child: Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black12,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${_items[i].i}',
                                style: TextStyle(
                                    fontSize: 17.0
                                ),
                              ),
                            )
                        )
                    );
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}