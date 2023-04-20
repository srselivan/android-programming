import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController _controller;
  late bool _switcher;
  late String _text;

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _text = (prefs.getString('text') ?? "");
      _controller.text = _text;
      _switcher = (prefs.getBool('switcher') ?? false);
    });
  }

  void _uploadSwitcher(bool switcher) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _switcher = (prefs.getBool('switcher') ?? false);
      _switcher = switcher;
      prefs.setBool('switcher', _switcher);
    });
  }

  void _uploadText(String text) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _text = (prefs.getString('text') ?? "");
      _text = text;
      _controller.text = _text;
      prefs.setString('text', _text);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _loadSettings();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notes Page'),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _controller,
                    onSubmitted: (value) {
                      _uploadText(value);
                    },
                  ),
                  Switch(
                    onChanged: (value) {
                      _uploadSwitcher(value);
                    },
                    value: _switcher,
                  ),
                ],
              ),
            )
        )
    );
  }
}