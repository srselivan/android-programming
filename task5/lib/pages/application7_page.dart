import 'package:flutter/material.dart';
import 'package:web_browser/web_browser.dart';

class Application7Page extends StatefulWidget {
  const Application7Page({super.key});

  @override
  State<Application7Page> createState() => _Application7PageState();
}

class _Application7PageState extends State<Application7Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application 7 Page'),
      ),
      body: const SafeArea(
        child: Browser(
          initialUriString: 'https://youtu.be/dQw4w9WgXcQ',
        ),
      ),
    );
  }
}
