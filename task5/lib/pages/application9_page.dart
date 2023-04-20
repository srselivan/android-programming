import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

class Application9Page extends StatefulWidget {
  const Application9Page({super.key});

  @override
  State<Application9Page> createState() => _Application9PageState();
}

class _Application9PageState extends State<Application9Page> {
  var _menuItems = ['Menu item 1','Menu item 2','Menu item 3'];
  String _selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Application 9 Page'),
        ),
        body: Stack(
          children: [
            GestureDetector(
                onVerticalDragStart: (details) async {
                  var value = await showTopModalSheet<String?>(context,
                      Builder(builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _menuItems.length,
                                    itemBuilder: (context, i) => ListTile(
                                      title: Text(
                                          _menuItems.elementAt(i),
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectedItem = _menuItems.elementAt(i);
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: const Text(
                                    'Top menu',
                                    textScaleFactor: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }));
                },
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.all(7),
                    height: 10,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                )),
            GestureDetector(
                onVerticalDragStart: (details) {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                          child: Padding(
                        padding: EdgeInsets.all(30),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: const Text(
                                  'Bottom menu',
                                  textScaleFactor: 1.4,
                                ),
                              ),
                              SizedBox(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _menuItems.length,
                                  itemBuilder: (context, i) => ListTile(
                                    title: Text(
                                      _menuItems.elementAt(i),
                                      textAlign: TextAlign.center,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _selectedItem = _menuItems.elementAt(i);
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                    },
                  );
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.all(7),
                    height: 10,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: Text('${_selectedItem}'),
            )
          ],
        ));
  }
}
