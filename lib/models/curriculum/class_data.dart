import 'package:assistant/constant.dart';
import 'curriculum.dart';

class ClassData {

  ClassData({file, id}) {
    curriculums = initCurriculumData(file: file, id: id);
  }
  static List<Curriculum> curriculums = [];

  List<Curriculum> getWeekData(
      {required List<Curriculum> curriculums, required String week}) {
    List<Curriculum> newCurriculum = [];
    for (int index = 0; index < curriculums.length; index++) {
      if (curriculums[index].week == week) {
        newCurriculum.add(curriculums[index]);
      }
    }
    return newCurriculum;
  }

  List<Curriculum> initCurriculumData({required Map file, required String id}) {
    var data = file[id];
    List<Curriculum> curriculums = [];
    for (int i = 0; i < file[id].length; i++) {
      if (data[i]['lessonTime'][0] == '一') {
        curriculums.add(Curriculum(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: 'Mon',
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '二') {
        curriculums.add(Curriculum(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: 'Tues',
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '三') {
        curriculums.add(Curriculum(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: 'Wed',
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '四') {
        curriculums.add(Curriculum(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: "Thur",
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      } else if (data[i]['lessonTime'][0] == '五') {
        curriculums.add(Curriculum(
            subject: data[i]['lesson'],
            time: data[i]['lessonTime'],
            week: 'Fri',
            teacher: data[i]['teacher'],
            location: data[i]['lessonClass']));
      }
    }
    return curriculums;
  }
}
