import 'package:assistant/constant.dart';
import 'package:assistant/models/note/note_data.dart';
import 'package:flutter/material.dart';
import 'package:assistant/models/note/note.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NoteWidget extends StatefulWidget {
  NoteWidget({super.key, required this.note});
  final Note note;

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){
        Provider.of<NoteData>(context, listen:  false).removeNote(note: widget.note);
      },
      child: GestureDetector(
        onLongPress: (){},
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 40.0,
                      child: FittedBox(
                        child: Text(
                          widget.note.getLastTime().inDays.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    title: Text(
                      widget.note.title,
                      style: kNoteTitleTextStyle,
                    ),
                    isThreeLine: true,
                    trailing: Text(widget.note.subject),
                    subtitle: Text(
                      widget.note.description,
                      style: kNoteDescriptionTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat.yMMMd().format(widget.note.deadTime),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Divider(
                color: Colors.grey.shade200,
                thickness: 2.0,
                height: 5.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
