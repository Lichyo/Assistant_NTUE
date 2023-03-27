import 'package:assistant/screens/note/add_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:assistant/models/note/note.dart';
import 'package:assistant/db/NoteDB.dart';
import 'package:assistant/components/note/note_widget.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  bool isLoad = false;
  List<Note> notes = [];
  @override
  void initState() {
    refreshNotes();
    super.initState();
  }

  @override
  void dispose() {
    NoteDB.instance.close();
    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoad = true);
    notes = await NoteDB.instance.readAllNotes();
    setState(() => isLoad = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const AddNote()));
            refreshNotes();
          },
          child: const Icon(Icons.add),
        ),
        // body: const NoteList(),
        body: Center(
          child: isLoad
              ? const CircularProgressIndicator()
              : notes.isEmpty
                  ? const Text(
                      'Note is empty',
                      style: TextStyle(fontSize: 30.0),
                    )
                  : ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final Note note = notes[index];
                        return NoteWidget(
                          note: note,
                          noteCallback: () async {
                            final db = NoteDB.instance;
                            db.delete(note.id!);
                            refreshNotes();
                            print('Hello');
                          },
                        );
                      },
                    ),
        ),
      ),
    );
  }

  // Widget buildNotes() => StaggeredGridView.countBuilder(
  //       padding: const EdgeInsets.all(8),
  //       itemCount: notes.length,
  //       staggeredTileBuilder: (index) => StaggeredTile.fit(2),
  //       crossAxisCount: 4,
  //       mainAxisSpacing: 4,
  //       crossAxisSpacing: 4,
  //       itemBuilder: (context, index) {
  //         final note = notes[index];
  //
  //         return GestureDetector(
  //           onTap: () async {
  //             await Navigator.of(context).push(MaterialPageRoute(
  //               builder: (context) => NoteDetailPage(noteId: note.id!),
  //             ));
  //
  //             refreshNotes();
  //           },
  //           child: NoteCardWidget(note: note, index: index),
  //         );
  //       },
  //     );
}
