import 'package:flutter/material.dart';
import 'package:assistant/components/lesson/week_container.dart';
import 'package:assistant/db/lesson_database.dart';
import 'package:assistant/models/lesson/lesson.dart';
import 'package:assistant/models/lesson/lesson_controller.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:assistant/models/account/account.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  bool isLoad = false;
  bool isNoData = false;
  List<Lesson> lessons = [];
  final _account = Account.instance;

  @override
  void initState() {
    super.initState();
    refreshCurriculum();
  }

  @override
  void dispose() {
    super.dispose();
    LessonDatabase.instance.close();
  }

  bool isWeekHasData(String week) {
    for (int index = 0; index < lessons.length; index++) {
      if (lessons[index].week == week) {
        return true;
      }
    }
    return false;
  }

  Future refreshCurriculum() async {
    setState(() => isLoad = true);
    final tempLessons = await LessonDatabase.instance.readAllLesson();
    setState(() {
      lessons = tempLessons;
    });
    if (lessons.isEmpty) {
      await initCurriculum();
      isNoData = lessons.isEmpty ? true : false;
    }
    setState(() => isLoad = false);
  }

  Future initCurriculum() async {
    var lessonsFromWeb = await get(Uri.parse(
        'http://120.127.27.30:5000/done?account=${_account?.ID}&password=${_account?.password}'));
    var map = jsonDecode(lessonsFromWeb.body);
    LessonController.instance.initLesson(file: map, id: _account?.ID);
    lessons = LessonController.instance.readAllLesson();
    for (int i = 0; i < lessons.length; i++) {
      if(lessons[i].subject == "false") {
        isNoData = true;
        return;
      }
      var classData = lessons[i];
      var db = LessonDatabase.instance;
      db.create(
        Lesson(
            subject: classData.subject,
            time: classData.time,
            week: classData.week,
            location: classData.location,
            teacher: classData.teacher),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoad
          ? const CircularProgressIndicator()
          : isNoData
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '查無資料',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 40.0),
                      ),
                      Text(
                        '請確認學號和密碼是否和登入iNTUE同一組',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '請至設定頁面更改，或聯絡開發人員',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )
              : Scaffold(
                  floatingActionButton: FloatingActionButton(
                    onPressed: () async {
                      setState(() {
                        LessonDatabase.instance.deleteAllLesson();
                        refreshCurriculum();
                      });
                    },
                    child: const Icon(Icons.refresh),
                  ),
                  body: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    children: [
                      Column(
                        children: [
                          Visibility(
                            visible: isWeekHasData('Mon'),
                            child: WeekContainer(week: 'Mon', lessons: lessons),
                          ),
                          Visibility(
                            visible: isWeekHasData('Tues'),
                            child: WeekContainer(week: 'Tues', lessons: lessons),
                          ),
                          Visibility(
                            visible: isWeekHasData('Wed'),
                            child: WeekContainer(week: 'Wed', lessons: lessons),
                          ),
                          Visibility(
                            visible: isWeekHasData('Thur'),
                            child: WeekContainer(week: 'Thur', lessons: lessons),
                          ),
                          Visibility(
                            visible: isWeekHasData('Fri'),
                            child: WeekContainer(week: 'Fri', lessons: lessons),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
    );
  }
}
