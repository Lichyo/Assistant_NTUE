import 'package:assistant/components/note/note_list.dart';
import 'package:assistant/main.dart';
import 'package:assistant/models/note/note_data.dart';
import 'package:assistant/screens/note/add_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const AddNote()));
          },
          child: const Icon(Icons.add),
        ),
        body: const NoteList(),
      ),
    );
  }
}
