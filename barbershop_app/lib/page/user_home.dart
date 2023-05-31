import 'package:barbershop_app/page/order_date_selector.dart';
import 'package:barbershop_app/page/order_type_selector.dart';
import 'package:barbershop_app/page/orders_history.dart';
import 'package:flutter/material.dart';

import '../widget/create_route.dart';

class UserHome extends StatefulWidget {
  final String? number;

  const UserHome({super.key, this.number});

  @override
  UserHomeState createState() => UserHomeState();
}

class UserHomeState extends State<UserHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/auth', (Route<dynamic> route) => false);
                },
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Icon(Icons.arrow_back_outlined),
                    Text("Exit")
                  ],
                )
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Text(
              "+7${widget.number}",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(createRoute(const OrdersHistory()));
                },
                child: const Text('История записей')
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(createRoute(OrderTypeSelector(number: widget.number ?? "+79998887766")));
                },
                child: const Text('Новая запись')
            ),
          ],
        ),
      )
    );
  }
}