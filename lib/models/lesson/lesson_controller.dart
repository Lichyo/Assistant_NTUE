import 'lesson.dart';

class LessonController {

  static final LessonController instance = LessonController._init();
  List<Lesson> lessons = [];

  LessonController._init();

  List<Lesson> getWeekData(
      {required List<Lesson> lessons, required String week}) {
    List<Lesson> newLessons = [];
    for (int index = 0; index < lessons.length; index++) {
      if (lessons[index].week == week) {
        newLessons.add(lessons[index]);
      }
    }
    return newLessons;
  }

  List<Lesson> readAllLesson() {
    return lessons;
  }

  void initLesson({required Map file, required String? id}) {
    var data = file[id];
    List<Lesson> tempLessons = [];
    for (int i = 0; i < file[id].length; i++) {
      if (data[i]['lessonTime'][0] == '一') {
        tempLessons.add(Lesson(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: 'Mon',
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '二') {
        tempLessons.add(Lesson(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: 'Tues',
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '三') {
        tempLessons.add(Lesson(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: 'Wed',
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '四') {
        tempLessons.add(Lesson(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: "Thur",
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '五') {
        tempLessons.add(Lesson(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: 'Fri',
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      }
    }
    lessons = tempLessons;
  }
}
