import 'package:flutter/material.dart';
import 'package:assistant/models/lesson/lesson.dart';
import 'package:assistant/pages/chat/chat_screen.dart';

class LessonContainer extends StatelessWidget {
  const LessonContainer({
    super.key,
    required this.lesson,
  });
  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              className: lesson.subject,
            ),
          ),
        );
      },
      child: ListTile(
        title: Text(
          lesson.subject,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
        ),
        subtitle: Text(
          lesson.time.toString(),
          style: TextStyle(color: Colors.grey.shade800),
        ),
        isThreeLine: true,
      ),
    );
  }
}
