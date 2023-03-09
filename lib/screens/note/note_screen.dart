import 'package:assistant/screens/note/add_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:assistant/components/note/note_list.dart';

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
      body: NoteList(),
    );
  }
}
