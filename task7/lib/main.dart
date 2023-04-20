import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:task7/pages/app4.dart';



void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Counter())
          ],
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Placeholder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}