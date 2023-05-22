import 'package:assistant/constant.dart';
import 'package:flutter/material.dart';
import 'package:assistant/models/note/note.dart';
import 'package:intl/intl.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget(
      {super.key,
      required this.note,
      required this.onLongPressed,
      required this.onPressed});

  final Note note;
  final VoidCallback onLongPressed;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPressed,
      onTap: onPressed,
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: SizedBox(
                    width: 50.0,
                    height: 40.0,
                    child: FittedBox(
                      child: Text(
                        note.getLastTime().inDays.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  title: Text(
                    note.title,
                    style: kNoteTitleTextStyle,
                  ),
                  isThreeLine: true,
                  trailing: Text(note.subject),
                  subtitle: Text(
                    note.description,
                    style: kNoteDescriptionTextStyle,
                  ),
                ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat.yMMMd().format(note.deadTime),
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
    );
  }
}
