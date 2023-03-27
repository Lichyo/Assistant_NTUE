import 'package:assistant/constant.dart';

const String classTable = 'class';

class Curriculum {
  int? id;
  String subject;
  String? teacher;
  String? location;
  Week week;
  DateTime time;

  Curriculum(
      {required this.subject,
      this.id,
      this.location,
      this.teacher,
      required this.time,
      required this.week});
  static Curriculum fromJson(Map<String, Object?> json) => Curriculum(
        id: json[ClassField.id] as int?,
        subject: json[ClassField.subject] as String,
        teacher: json[ClassField.teacher] as String,
        week: json[ClassField.week] as Week,
        time: DateTime.parse(
            json[ClassField.time] as String), // special object iso
      );

  Map<String, Object?> toJson() => {
        ClassField.id: id,
        ClassField.subject: subject,
        ClassField.teacher: teacher,
        ClassField.location: location,
        ClassField.week: week,
        ClassField.time: time.toIso8601String(),
      };

  Curriculum copy({
    int? id,
    String? teacher,
    DateTime? time,
    String? location,
    String? subject,
    Week? week,
  }) =>
      Curriculum(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        location: location ?? this.location,
        teacher: teacher ?? this.teacher,
        time: time ?? this.time,
        week: week ?? this.week,
      );
}

class ClassField {
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
