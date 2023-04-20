import 'package:flutter/material.dart';
import 'package:task5/pages/application10_page.dart';
import 'package:task5/pages/application11_page.dart';
import 'package:task5/pages/application2_page.dart';
import 'package:task5/pages/application3_page.dart';
import 'package:task5/pages/application4_page.dart';
import 'package:task5/pages/application8_page.dart';

import 'application12_page.dart';
import 'application1_page.dart';
import 'application5_page.dart';
import 'application6_page.dart';
import 'application7_page.dart';
import 'application9_page.dart';

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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Application1Page(0)),
                    );
                  },
                  child: const Text('application 1'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Application2Page()),
                    );
                  },
                  child: const Text('application 2'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Application3Page()),
                    );
                  },
                  child: const Text('application 3'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Application4Page()),
                    );
                  },
                  child: const Text('application 4'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Application5Page()),
                    );
                  },
                  child: const Text('application 5'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Application6Page()),
                    );
                  },
                  child: const Text('application 6'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Application7Page()),
                    );
                  },
                  child: const Text('application 7'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Application8Page()),
                    );
                  },
                  child: const Text('application 8'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Application9Page()),
                    );
                  },
                  child: const Text('application 9'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Application10Page()),
                    );
                  },
                  child: const Text('application 10'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Application11Page()),
                    );
                  },
                  child: const Text('application 11'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Application12Page()),
                    );
                  },
                  child: const Text('application 11'),
                ),
              ],
            ),
          )
        )
    );
  }

}