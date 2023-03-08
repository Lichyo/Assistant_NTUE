import 'package:assistant/constant.dart';

class Curriculum {
  String className;
  String? teacher;
  String? location;
  Week week;
  String time;

  Curriculum(
      {required this.className,
      this.location,
      this.teacher,
      required this.time,
      required this.week});
}
