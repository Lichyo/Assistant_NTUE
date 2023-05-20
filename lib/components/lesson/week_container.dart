import 'package:flutter/material.dart';
import 'package:assistant/components/lesson/lesson_container.dart';
import 'package:assistant/models/lesson/lesson.dart';

List<LessonContainer> getWeekData(String week, List<Lesson> lessons) {
  List<LessonContainer> lessonContainers = [];
  for (int index = 0; index < lessons.length; index++) {
    if (lessons[index].week == week) {
      lessonContainers.add(LessonContainer(lesson: lessons[index]));
    }
  }
  return lessonContainers;
}

class WeekContainer extends StatelessWidget {
  WeekContainer({
    super.key,
    required this.week,
    required this.lessons,
  });
  String week;
  List<Lesson> lessons;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            week,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Column(
            children: getWeekData(week, lessons),
          ),
        ],
      ),
    );
  }
}
