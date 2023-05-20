const String lessonTable = 'lesson';

class Lesson {
  int? id;
  String subject;
  String? teacher;
  String? location;
  String week;
  String time;

  Lesson(
      {required this.subject,
      this.id,
      this.location,
      this.teacher,
      required this.time,
      required this.week});
  static Lesson fromJson(Map<String, Object?> json) => Lesson(
        id: json[LessonField.id] as int?,
        subject: json[LessonField.subject] as String,
        teacher: json[LessonField.teacher] as String,
        week: json[LessonField.week] as String,
        time: json[LessonField.time] as String,
      );

  Map<String, Object?> toJson() => {
        LessonField.id: id,
        LessonField.subject: subject,
        LessonField.teacher: teacher,
        LessonField.location: location,
        LessonField.week: week,
        LessonField.time: time,
      };

  Lesson copy({
    int? id,
    String? teacher,
    String? time,
    String? location,
    String? subject,
    String? week,
  }) =>
      Lesson(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        location: location ?? this.location,
        teacher: teacher ?? this.teacher,
        time: time ?? this.time,
        week: week ?? this.week,
      );
}

class LessonField {
  static final List<String> values = [
    id,
    subject,
    time,
    location,
    teacher,
    week,
  ];

  static const String id = '_id';
  static const String week = 'week';
  static const String subject = 'subject';
  static const String time = 'time';
  static const String location = 'location';
  static const String teacher = 'teacher';
}
