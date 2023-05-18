import 'package:flutter/material.dart';
import 'package:assistant/components/curriculum/week_container.dart';
import 'package:assistant/db/curriculum_database.dart';
import 'package:assistant/models/curriculum/curriculum.dart';
import 'package:assistant/models/curriculum/class_data.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:assistant/models/account/account.dart';

class BasicCurriculumScreen extends StatefulWidget {
  const BasicCurriculumScreen({Key? key}) : super(key: key);

  @override
  State<BasicCurriculumScreen> createState() => _BasicCurriculumScreenState();
}

class _BasicCurriculumScreenState extends State<BasicCurriculumScreen> {
  bool isLoad = false;
  List<Curriculum> curriculums = [];
  final _account = Account.instance;

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
    curriculums = await ClassDatabase.instance.readAllLesson();
    if (curriculums.isEmpty) {
      await initCurriculum();
    }
    setState(() => isLoad = false);
  }

  Future initCurriculum() async {
    setState(() => isLoad = true);
    var data = await get(Uri.parse(
        'http://127.0.0.1:5001/done?account=${_account?.ID}&password=${_account?.password}'));
    var map = jsonDecode(data.body);
    ClassData classData = ClassData(file: map, id: _account?.ID);
    curriculums = ClassData.curriculumData;
    for (int i = 0; i < ClassData.curriculumData.length; i++) {
      var classData = ClassData.curriculumData[i];
      var db = ClassDatabase.instance;
      db.create(
        Curriculum(
            subject: classData.subject,
            time: classData.time,
            week: classData.week,
            location: classData.location,
            teacher: classData.teacher),
      );
    }
    setState(() => isLoad = false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoad
          ? const CircularProgressIndicator()
          : Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () async{
                  setState(() {
                    ClassDatabase.instance.deleteAllLesson();
                    refreshCurriculum();
                  });
                },
                child: const Icon(Icons.refresh),
              ),
              body: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                children: [
                  Column(
                    children: [
                      WeekContainer(week: 'Mon', curriculums: curriculums),
                      WeekContainer(week: 'Tues', curriculums: curriculums),
                      WeekContainer(week: 'Wed', curriculums: curriculums),
                      WeekContainer(week: 'Thur', curriculums: curriculums),
                      WeekContainer(week: 'Fri', curriculums: curriculums),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
