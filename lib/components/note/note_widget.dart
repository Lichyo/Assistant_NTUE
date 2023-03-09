import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.title,
    required this.description,
    required this.deadTime,
  });
  final String title;
  final String description;
  final DateTime deadTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.album),
                title: Text(title),
                isThreeLine: true,
                subtitle: Text(description, ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(deadTime.toString()),
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
