import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late TextEditingController _controller;
  late List<String> _notes;

  void _loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notes = (prefs.getStringList('notes') ?? []);
    });
  }

  void _uploadNotes(String note) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notes = prefs.getStringList('notes') ?? [];
      _notes.add(note);
      prefs.setStringList('notes', _notes);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _loadNotes();
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
                ),
                ElevatedButton(
                  onPressed: () {
                    _uploadNotes(_controller.text);
                  },
                  child: Text('Append')
                ),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _notes.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            _notes.removeAt(i);
                          });
                        },
                        title: Text(_notes[i]),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        )
    );
  }
}