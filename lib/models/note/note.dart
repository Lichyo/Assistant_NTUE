
class Note {
  String title;
  String description;
  DateTime deadTime;
  String subject;

  Note({
    required this.title,
    this.description = '',
    required this.deadTime,
    required this.subject,
  });

  Duration getLastTime() {
    final Duration duration = deadTime.difference(DateTime.now());
    return duration;
  }
}
