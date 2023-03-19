const String noteTable = 'notes';

class Note {
  int? id;
  String title;
  DateTime deadTime;
  String description;
  String subject;

  Note({
    this.id,
    required this.subject,
    required this.title,
    required this.deadTime,
    required this.description,
  });

  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteField.id] as int?,
    title: json[NoteField.title] as String,
    description: json[NoteField.description] as String,
    subject: json[NoteField.subject] as String,
    deadTime: DateTime.parse(
        json[NoteField.deadTime] as String), // special object iso
  );

  Map<String, Object?> toJson() => {
    NoteField.id: id,
    NoteField.title: title,
    NoteField.description: description,
    NoteField.subject: subject,
    NoteField.deadTime: deadTime.toIso8601String(),
  };

  Note copy({
    int? id,
    String? title,
    DateTime? deadTime,
    String? description,
    String? subject,
  }) =>
      Note(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        title: title ?? this.title,
        description: description ?? this.description,
        deadTime: deadTime ?? this.deadTime,
      );

  Duration getLastTime() {
    final Duration duration = deadTime.difference(DateTime.now());
    return duration;
  }
}

class NoteField {
  static final List<String> values = [
    id,
    title,
    description,
    subject,
    deadTime,
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String deadTime = 'deadTime';
  static const String description = 'description';
  static const String subject = 'subject';
}
