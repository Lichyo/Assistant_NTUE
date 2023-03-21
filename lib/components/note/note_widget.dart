import 'package:assistant/constant.dart';
import 'package:flutter/material.dart';
import 'package:assistant/models/note/note.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:assistant/db/NoteDB.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.note, required this.noteCallback});
  final Note note;
  final VoidCallback noteCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: noteCallback,
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                // Slidable(
                //   key: const ValueKey(0),
                //   endActionPane: ActionPane(
                //     motion: const ScrollMotion(),
                //
                //     // A pane can dismiss the Slidable.
                //     dismissible: DismissiblePane(onDismissed: () {}),
                //
                //     // All actions are defined in the children parameter.
                //     children: [
                //       // A SlidableAction can have an icon and/or a label.
                //       SlidableAction(
                //         onPressed: (context){},
                //         backgroundColor: const Color(0xFFFE4A49),
                //         foregroundColor: Colors.white,
                //         icon: Icons.delete,
                //         label: 'Delete',
                //       ),
                //       SlidableAction(
                //         onPressed: (context){},
                //         backgroundColor: const Color(0xFF21B7CA),
                //         foregroundColor: Colors.white,
                //         icon: Icons.share,
                //         label: 'Share',
                //       ),
                //     ],
                //   ),
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
