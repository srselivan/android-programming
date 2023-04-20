import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Application11Page extends StatefulWidget {
  const Application11Page({super.key});

  @override
  _Application11PageState createState() => _Application11PageState();
}

class _Application11PageState extends State<Application11Page> {
  int _counter = 0;

  void _showOverlay(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    late OverlayEntry overlay;

    overlay = OverlayEntry(
      maintainState: true,
      builder: (context) {
        return Positioned(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.5,
          left: MediaQuery.of(context).size.width * 0.15,
          top: MediaQuery.of(context).size.height * 0.25,
          child: Material(
            type: MaterialType.transparency,
            child: Center(
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 220, 220, 0.8)
                  ),
                  padding: EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text('${_counter}', textScaleFactor: 3.0,),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(onPressed: () => overlayState.setState(() {_counter++;}), child: Text('+')),
                            ElevatedButton(onPressed: () => overlayState.setState(() {_counter--;}), child: Text('-')),
                            ElevatedButton(onPressed: () => overlay.remove(), child: Text('close')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ),
          ),
        );
      },
    );

    overlayState.insert(overlay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application 11 Page'),
      ),
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () => _showOverlay(context),
            child: Text('get overlay'),
          ),
        ),
      ),
    );
  }
}
