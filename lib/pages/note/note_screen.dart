import 'package:assistant/pages/note/add_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:assistant/models/note/note.dart';
import 'package:assistant/db/NoteDB.dart';
import 'package:assistant/components/note/note_widget.dart';
import 'package:assistant/services/notification_api.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  bool isLoad = false;
  bool isInit = false;
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
    if (notes.isEmpty && !isInit) {
      initNotes();
      isInit = true;
      refreshNotes();
    }
    setState(() => isLoad = false);
  }

  Future initNotes() async {
    final db = NoteDB.instance;
    db.create(Note(
      title: '長按以刪除Note',
      description: '這裡可以放詳細資訊',
      subject: '使用說明',
      deadTime: DateTime(2023, 7, 20),
    ));

    db.create(Note(
      title: '點擊以開啟Note提醒',
      description: '提醒將會在倒數七日、三日、當日發出',
      subject: '使用說明',
      deadTime: DateTime(2023, 7, 20),
    ));
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
                          onPressed: () async {
                            // await NotificationApi.showScheduleNotification(
                            //     title: '${note.title}-${note.subject}',
                            //     body: note.description,
                            //     scheduledDate: DateTime.now()
                            //         .add(const Duration(seconds: 5)));
                            await NotificationApi.showScheduleNotification(
                                title: '${note.title}-${note.subject}',
                                body: note.description,
                                scheduledDate: note.deadTime
                                    .add(const Duration(days: -7, hours: 8)));
                            await NotificationApi.showScheduleNotification(
                                title: '${note.title}-${note.subject}',
                                body: note.description,
                                scheduledDate: note.deadTime
                                    .add(const Duration(days: -3, hours: 8)));
                            await NotificationApi.showScheduleNotification(
                                title: '${note.title}-${note.subject}',
                                body: note.description,
                                scheduledDate: note.deadTime
                                    .add(const Duration(hours: 8)));
                          },
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
