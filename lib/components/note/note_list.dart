import 'package:flutter/material.dart';
import 'note_widget.dart';
import 'package:assistant/models/note/note_data.dart';

class NoteList extends StatelessWidget {
  NoteList({Key? key}) : super(key: key);
  final NoteData noteData = NoteData();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return NoteWidget(note: noteData.noteData[index]);
      },
      itemCount: noteData.noteData.length,
    );
  }
}
