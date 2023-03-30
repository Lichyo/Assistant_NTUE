import 'package:flutter/material.dart';
import 'package:assistant/components/curriculum/week_container.dart';
import 'package:assistant/constant.dart';
import 'package:assistant/db/curriculum_database.dart';
import 'package:assistant/models/curriculum/curriculum.dart';

class BasicCurriculumScreen extends StatefulWidget {
  const BasicCurriculumScreen({Key? key}) : super(key: key);

  @override
  State<BasicCurriculumScreen> createState() => _BasicCurriculumScreenState();
}

class _BasicCurriculumScreenState extends State<BasicCurriculumScreen> {
  bool isLoad = false;
  List<Curriculum> curriculums = [];

  @override
  void initState() {
    refreshCurriculum();
    super.initState();
  }

  @override
  void dispose() {
    ClassDatabase.instance.close();
    super.dispose();
  }

  Future refreshCurriculum() async {
    setState(() => isLoad = true);
    curriculums = await ClassDatabase.instance.readAllCurriculum();
    setState(() => isLoad = false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoad ? const CircularProgressIndicator() : Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: const Icon(Icons.add),
        ),
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
      ),
    );
  }
}
