import 'dart:async';
import 'package:flutter/material.dart';

class App3 extends StatefulWidget {
  const App3({Key? key}) : super(key: key);

  @override
  State<App3> createState() => _App3State();
}

class _StopwatchShower extends StatelessWidget{
  final int minutes;
  final int seconds;

  const _StopwatchShower({required this.minutes, required this.seconds});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(4),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '${minutes}',
              textScaleFactor: 2.0,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(4),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '${seconds % 60}',
              textScaleFactor: 2.0,
            ),
          ),
        ),
      ],
    );
  }

}

class _App3State extends State<App3> with SingleTickerProviderStateMixin {
  final Stopwatch _stopwatch = Stopwatch();
  bool _isPlayed = false;
  late Timer _timer;
  int _minutes = 0;
  int _seconds = 0;


  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
      setState(() {
        _minutes = _stopwatch.elapsed.inMinutes;
        _seconds = _stopwatch.elapsed.inSeconds;
      });
    });

    _stopwatch.start();
  }

  void _stop() {
    _timer.cancel();
    _stopwatch.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Application 3 Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _StopwatchShower(
                minutes: _minutes,
                seconds: _seconds,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if( _isPlayed ) {
                          _stop();
                        } else {
                          _start();
                        }
                        _isPlayed = !_isPlayed;
                      });
                    },
                    child: Text(_isPlayed ? 'stop' : 'start')
                )
              )
            ],
          ),
        )
    );
  }
}