import 'package:assistant/models/note/note.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note_widget.dart';
import 'package:assistant/models/note/note_data.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(builder: (context, noteData, child) {
      return ListView.builder(
        itemCount: noteData.notes.length,
        itemBuilder: (context, index) {
          final Note note = noteData.notes[index];
          return NoteWidget(
            note: Note(
              subject: note.subject,
              title: note.title,
              description: note.description,
              deadTime: note.deadTime,
            ),
          );
        },
      );
    });
  }
}
