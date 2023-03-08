import 'package:flutter/material.dart';
import 'package:assistant/components/curriculum/week_container.dart';
import 'package:assistant/constant.dart';

class BasicCurriculumScreen extends StatelessWidget {
  const BasicCurriculumScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          children: [
            Column(
              children: [
                WeekContainer(week: Week.mon),
                WeekContainer(week: Week.tues),
                WeekContainer(week: Week.wed),
                WeekContainer(week: Week.thur),
                WeekContainer(week: Week.fri),
              ],
            ),
          ],
        ),
    );
  }
}
