import 'package:assistant/screens/curriculum/basic_curriculum_screen.dart';
import 'package:assistant/screens/note/note_screen.dart';
import 'package:assistant/screens/profile/account_screen.dart';
import 'package:flutter/material.dart';
import 'screens/setting/setting_screen.dart';
import 'screens/notification/notification_screen.dart';
import 'screens/issue_report_screen/issue_report_screen.dart';
import 'screens/curriculum/calendar_curriculum_screen.dart';

class ScreenController{
  int selectedPage = 0;
  List<Widget> menuList = [];
  //TODO: twist screenList to map data Structure
  List<Widget> screenList = [
    const BasicCurriculumScreen(),
    const AccountScreen(),
    const NoteScreen(),
    const SettingScreen(),
    const NotificationScreen(),
    const IssueReportScreen(),
    const CalendarCurriculumScreen(),
  ];

  Widget getPage() {
    return screenList[selectedPage];
  }
}
