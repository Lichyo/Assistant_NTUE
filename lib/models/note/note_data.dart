import 'dart:collection';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'note.dart';

class NoteData extends ChangeNotifier {
  List<Note> notes = [
    Note(
        title: 'Example',
        description: 'description',
        deadTime: DateTime.now(),
        subject: 'Testing Subject'),
    Note(
        title: 'Example',
        description: 'description',
        deadTime: DateTime.now(),
        subject: 'Testing Subject'),
  ];

  void addNote({title, description, deadTime, subject}) {
    final Note note = Note(
      title: title,
      description: description,
      deadTime: deadTime,
      subject: subject,
    );
    notes.add(note);
    notifyListeners();
  }

  void removeNote({note}) {
    notes.remove(note);
    notifyListeners();
  }

  UnmodifiableListView<Note> getNoteData() {
    return UnmodifiableListView(notes);
  }
}
