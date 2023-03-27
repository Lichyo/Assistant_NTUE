// import 'dart:collection';
// import 'package:flutter/cupertino.dart';
// import 'note.dart';
//
// class NoteData extends ChangeNotifier {
//   List<Note> notes = [
//     Note(
//         title: 'Tap to navigate into description',
//         description: 'Task 1',
//         deadTime: DateTime.now().add(
//           const Duration(days: 2),
//         ),
//         subject: 'System Task'),
//     Note(
//         title: 'Long pressed to remove this note',
//         description: 'Task 2',
//         deadTime: DateTime.now().add(
//           const Duration(days: 3),
//         ),
//         subject: 'System Task'),
//   ];
//   List<Note> sortedNoteData = [];
//   NoteData() {
//     sortedNoteData = getSortedNoteData();
//     for (int i = 0; i < notes.length; i++) {
//       print(sortedNoteData[i].deadTime);
//     }
//     notifyListeners();
//   }
//
//   void addNoteAndSort({title, description, deadTime, subject}) {
//     final Note note = Note(
//       title: title,
//       description: description,
//       deadTime: deadTime,
//       subject: subject,
//     );
//     notes.add(note);
//     notes = getSortedNoteData();
//     notifyListeners();
//   }
//
//   void removeNote({note}) {
//     notes.remove(note);
//     notifyListeners();
//   }
//
//   UnmodifiableListView<Curriculum> getNoteData() {
//     return UnmodifiableListView(notes);
//   }
//
//   List<Curriculum> getSortedNoteData() {
//     List<Curriculum> noteData = notes;
//     Curriculum note;
//     for (int i = 0; i < notes.length; i++) {
//       for (int j = 0; j < notes.length - 1; j++) {
//         if (notes[j].getLastTime() > notes[j + 1].getLastTime()) {
//           note = notes[j];
//           notes[j] = notes[j + 1];
//           notes[j + 1] = note;
//         } else {
//           continue;
//         }
//       }
//     }
//     return noteData;
//   }
// }
