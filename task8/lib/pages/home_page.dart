import 'package:flutter/material.dart';
import 'package:task8/pages/app2.dart';
import 'app1.dart';

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
                    onPressed: () => Navigator.push( context, MaterialPageRoute(builder: (context) => App2()),),
                    child: const Text('application 2'),
                  ),
                ],
              ),
            )
        )
    );
  }

}