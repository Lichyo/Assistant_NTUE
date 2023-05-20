import 'package:flutter/material.dart';
import 'package:assistant/components/curriculum/class_container.dart';
import 'package:assistant/models/curriculum/curriculum.dart';

List<ClassContainer> getWeekData(String week, List<Curriculum> curriculums) {
  List<ClassContainer> classContainers = [];
  for (int index = 0; index < curriculums.length; index++) {
    if (curriculums[index].week == week) {
      classContainers.add(ClassContainer(curriculum: curriculums[index]));
    }
  }
  return classContainers;
}

class WeekContainer extends StatelessWidget {
  WeekContainer({
    super.key,
    required this.week,
    required this.curriculums,
  });
  String week;
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
            week,
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
