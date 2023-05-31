import 'package:barbershop_app/page/user_home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  AuthState createState() => AuthState();
}

class AuthState extends State<Auth> {
  late TextEditingController _controller;
  bool _showError = false;
  RegExp regExp = RegExp(
    r"^\+[1-9]\d{10}$",
    caseSensitive: true,
  );

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _validateNumber(String number) {
    if (regExp.hasMatch("+7$number")) {
      setState(() {
        _showError = false;
      });
    } else {
      setState(() {
        _showError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const textFieldWidth = 200.0;

    return Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Введите номер телефона',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: textFieldWidth,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.phone,
                    showCursor: true,
                    maxLength: 10,
                    onSubmitted: (value) {
                      _validateNumber(value);
                    },
                    decoration: InputDecoration(
                      prefix: const Text("+7"),
                      counterText: "",
                      errorText: _showError ? ' ' : null,
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      letterSpacing: 5.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      _validateNumber(_controller.text);
                      if (!_showError) {
                        Navigator.of(context).pushAndRemoveUntil(PageTransition(child: UserHome(number: _controller.text), type: PageTransitionType.fade), (route) => false);
                      }
                    },
                    child: const Text('Продолжить')
                  ),
                )
              ],
            ),
          )
        )
    );
  }
}