import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'note.dart';

class NoteData extends ChangeNotifier {
  List<Note> notes = [
    Note(
        title: 'Example',
        description: 'description',
        deadTime: DateTime(2023, 4, 20),
        subject: 'Testing Subject'),
    Note(
        title: 'Example',
        description: 'description',
        deadTime: DateTime(2023, 1, 20),
        subject: 'Testing Subject'),
    Note(
        title: 'Example',
        description: 'description',
        deadTime: DateTime(2023, 3, 21),
        subject: 'Testing Subject'),
    Note(
        title: 'Example',
        description: 'description',
        deadTime: DateTime(2023, 3, 20),
        subject: 'Testing Subject'),
    Note(
        title: 'Example',
        description: 'description',
        deadTime: DateTime(2023, 3, 24),
        subject: 'Testing Subject'),
  ];
  List<Note> sortedNoteData = [];
  NoteData() {
     sortedNoteData = getSortedNoteData();
     for (int i = 0; i < notes.length; i++) {
       print(sortedNoteData[i].deadTime);
     }
    notifyListeners();
  }

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

  List<Note> getSortedNoteData() {
    List<Note> noteData = notes;
    Note note;
    for (int i = 0; i < notes.length; i++) {
      for (int j = 0; j < notes.length - 1; j++) {
        if (notes[j].getLastTime() > notes[j + 1].getLastTime()) {
          note = notes[j];
          notes[j] = notes[j + 1];
          notes[j + 1] = note;
        } else {
          continue;
        }
      }
    }
    return noteData;
  }
}
