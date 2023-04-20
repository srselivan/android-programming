import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationPage extends StatefulWidget {
  final double height;

  const AnimationPage({super.key, required this.height});

  @override
  State<AnimationPage> createState() => _AnimationPageState(height: height);
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin {
  final double size = 100;
  final double height;
  _AnimationPageState({required this.height});

  late AnimationController _controller;
  late Animation _offsetAnimation;
  late Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _offsetAnimation = Tween<Offset>(begin: const Offset(0, 0), end: Offset(0, height - (size * 3))).animate(_controller);
    _offsetAnimation.addListener(() {
      setState(() {});
    });
    _sizeAnimation = Tween(begin: size, end: size * 2).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Page"),
      ),
      body: Row(
        children: [
          Transform.translate(
            offset: _offsetAnimation.value,
            child: Container(
              color: Colors.red,
              height: _sizeAnimation.value,
              width: _sizeAnimation.value,
            ),
          )
        ],
      ),
    );
  }
}