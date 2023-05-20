import 'package:assistant/pages/note/add_note_screen.dart';
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
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    super.dispose();
    NoteDB.instance.close();
  }

  Future refreshNotes() async {
    setState(() => isLoad = true);
    List<Note> tempNotes = await NoteDB.instance.readAllNotes();
    setState(() {
      notes = tempNotes;
    });
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
                          onLongPressed: () async {
                            final db = NoteDB.instance;
                            db.delete(note.id!);
                            refreshNotes();
                          },
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
