import 'package:assistant/main.dart';
import 'package:assistant/screens/note/add_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:assistant/components/note/note_widget.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNote()));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          NoteWidget(
            title: 'Title',
            deadTime: DateTime.now(),
            description: 'Description',
          ),
        ],
      ),
    );
  }
}
