import 'package:assistant/models/curriculum/curriculum.dart';

class Note {
  String title;
  String description;
  DateTime deadTime;
  String className;

  Note({
    required this.title,
    required this.description,
    required this.deadTime,
    required this.className,
  });
}
