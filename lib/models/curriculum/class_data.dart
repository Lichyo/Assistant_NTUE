import 'package:assistant/constant.dart';
import 'curriculum.dart';

class ClassData {

  ClassData({file, id}) {
    curriculumData = initCurriculumData(file: file, id: id);
  }
  static List<Curriculum> curriculumData = [];

  List<Curriculum> getWeekData(
      {required List<Curriculum> curriculums, required Week week}) {
    List<Curriculum> newCurriculum = [];
    for (int index = 0; index < curriculums.length; index++) {
      if (curriculums[index].week == week) {
        newCurriculum.add(curriculums[index]);
      }
    }
    return newCurriculum;
  }

  List<String> getClassName() {
    List<String> className = [];
    for (int index = 0; index < curriculumData.length; index++) {
      className.add(curriculumData[index].subject);
    }
    return className;
  }

  List<Curriculum> initCurriculumData({required Map file, required String id}) {
    var data = file[id];
    List<Curriculum> curriculums = [];
    for (int i = 0; i < file[id].length; i++) {
      if (data[i]['lessonTime'][0] == '一') {
        curriculums.add(Curriculum(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: Week.mon,
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '二') {
        curriculums.add(Curriculum(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: Week.tues,
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '三') {
        curriculums.add(Curriculum(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: Week.wed,
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '四') {
        curriculums.add(Curriculum(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: Week.thur,
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '五') {
        curriculums.add(Curriculum(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: Week.fri,
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      }
    }
    return curriculums;
  }
}
