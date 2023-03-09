import 'package:flutter/material.dart';
import 'package:assistant/models/note/note.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.note
  });
  final Note note;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.album),
                title: Text(note.title),
                isThreeLine: true,
                subtitle: Text(note.description),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(note.deadTime.toString()),
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
    );
  }
}
