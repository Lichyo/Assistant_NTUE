import 'package:assistant/constant.dart';
import 'curriculum.dart';

class ClassData {
  List<Curriculum> curriculumData = [
    Curriculum(className: '應用電子學', week: Week.mon, time: '12:10 ~ 15:20'),
    Curriculum(className: '體育', week: Week.tues, time: '10:10 ~ 12: 00'),
    Curriculum(className: '應用電子學實驗', week: Week.tues, time: '13:30 ~ 15:20'),
    Curriculum(className: '機率', week: Week.wed, time: '9:10 ~ 12:00'),
    Curriculum(className: '計算機組織', week: Week.wed, time: '13:30 ~ 16:20'),
    Curriculum(className: '演算法', time: '9:10 ~ 12:00', week: Week.thur),
    Curriculum(className: '網路程式設計', time: '13:30 ~ 16:20', week: Week.thur),
    Curriculum(className: '計算機實驗', time: '10:10 ~ 12:00', week: Week.fri),
    Curriculum(className: '人工智慧導論', time: '12:10 ~ 15:10', week: Week.fri),
  ];

  List<Curriculum> getWeekData({required List<Curriculum> curriculums, required Week week}) {
    List<Curriculum> newCurriculum = [];
    for(int index = 0; index < curriculums.length; index++) {
      if(curriculums[index].week == week) {
        newCurriculum.add(curriculums[index]);
      }
    }
    return newCurriculum;
  }

  List<String> getClassName(){
    List<String> className = [];
    for(int index = 0; index < curriculumData.length; index++) {
      className.add(curriculumData[index].className);
    }
    return className;
  }
}
