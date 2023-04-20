import 'package:flutter/material.dart';
import 'package:task7/pages/app1.dart';
import 'package:task7/pages/app2.dart';
import 'package:task7/pages/app3.dart';
import 'package:provider/provider.dart';
import 'package:task7/pages/app5.dart';
import 'app4.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: const Text("Home page")),
        body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.push( context, MaterialPageRoute(builder: (context) => App1()),),
                    child: const Text('application 1'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push( context, MaterialPageRoute(builder: (context) => App2(height: MediaQuery.of(context).size.height,)),),
                    child: const Text('application 2'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push( context, MaterialPageRoute(builder: (context) => App3()),),
                    child: const Text('application 3'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<Counter>().increment();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const App4())
                      );
                    },
                    child: const Text('application 4'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push( context, MaterialPageRoute(builder: (context) => App5()),),
                    child: const Text('application 5'),
                  ),
                ],
              ),
            )
        )
    );
  }

}