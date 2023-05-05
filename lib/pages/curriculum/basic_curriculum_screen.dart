import 'package:assistant/pages/curriculum/add_subject_page.dart';
import 'package:flutter/material.dart';
import 'package:assistant/components/curriculum/week_container.dart';
import 'package:assistant/constant.dart';
import 'package:assistant/db/curriculum_database.dart';
import 'package:assistant/models/curriculum/curriculum.dart';
import 'package:assistant/models/curriculum/class_data.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';

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
    // curriculums = await ClassDatabase.instance.readAllCurriculum();
    var data = await get(Uri.parse('https://lichyo.github.io/Assistant_NTUE/'));
    var map = jsonDecode(data.body);
    ClassData classData = ClassData(file: map, id: '111016041');
    curriculums = ClassData.curriculumData;
    for (int i = 0; i < ClassData.curriculumData.length; i++) {
      print(ClassData.curriculumData[i].subject);
    }
    setState(() => isLoad = false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoad
          ? const CircularProgressIndicator()
          : Scaffold(
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => const AddSubjectPage()));
              //   },
              //   child: const Icon(Icons.add),
              // ),
              body: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                children: [
                  Column(
                    children: [
                      WeekContainer(week: Week.mon, curriculums: curriculums),
                      WeekContainer(week: Week.tues, curriculums: curriculums),
                      WeekContainer(week: Week.wed, curriculums: curriculums),
                      WeekContainer(week: Week.thur, curriculums: curriculums),
                      WeekContainer(week: Week.fri, curriculums: curriculums),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
