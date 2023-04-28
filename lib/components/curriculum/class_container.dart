import 'package:flutter/material.dart';
import 'package:assistant/models/curriculum/curriculum.dart';
import 'package:assistant/pages/chat/chat_screen.dart';

class ClassContainer extends StatelessWidget {
  const ClassContainer({
    super.key,
    required this.curriculum,
  });
  final Curriculum curriculum;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatScreen(
                  className: curriculum.subject,
                )));
      },
      child: ListTile(
        title: Text(
          curriculum.subject,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
        ),
        subtitle: Text(
          curriculum.time.toString(),
          style: TextStyle(color: Colors.grey.shade800),
        ),
        isThreeLine: true,
      ),
    );
  }
}
