import 'package:flutter/material.dart';
import 'package:assistant/components/curriculum/class_container.dart';
import 'package:assistant/models/curriculum/class_data.dart';
import 'package:assistant/constant.dart';
import 'package:assistant/models/curriculum/curriculum.dart';
import 'package:assistant/db/curriculum_database.dart';

String getWeek(Week week) {
  if (week == Week.mon) {
    return 'Mon';
  } else if (week == Week.tues) {
    return 'Tues';
  } else if (week == Week.wed) {
    return 'Wed';
  } else if (week == Week.thur) {
    return 'Thur';
  } else {
    return 'Fri';
  }
}

List<ClassContainer> getWeekData(Week week, List<Curriculum> curriculums) {
  List<ClassContainer> classContainers = [];
  for (int index = 0; index < curriculums.length; index++) {
    if (curriculums[index].week == week) {
      classContainers.add(ClassContainer(curriculum: curriculums[index]));
    }
  }
  return classContainers;
}

// ignore: must_be_immutable
class WeekContainer extends StatelessWidget {
  WeekContainer({
    super.key,
    required this.week,
    required this.curriculums,
  });
  Week week;
  List<Curriculum> curriculums;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getWeek(week),
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Column(
            children: getWeekData(week, curriculums),
          ),
        ],
      ),
    );
  }
}
