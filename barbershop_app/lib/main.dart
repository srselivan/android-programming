import 'package:barbershop_app/page/auth.dart';
import 'package:barbershop_app/page/user_home.dart';
import 'package:flutter/material.dart';
import 'page/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbershop App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const Home(),
        '/home': (context) => const UserHome(),
      },
      home: const Home(),
    );
  }
}