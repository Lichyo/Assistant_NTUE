
class Note {
  String title;
  String description;
  String deadTime;
  String subject;

  Note({
    required this.title,
    this.description = '',
    required this.deadTime,
    required this.subject,
  });
}
