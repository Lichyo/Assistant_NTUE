import 'package:assistant/screens/curriculum/basic_curriculum_screen.dart';
import 'package:assistant/screens/note/note_screen.dart';
import 'package:assistant/screens/account/account_screen.dart';
import 'package:flutter/material.dart';
import 'screens/setting/setting_screen.dart';
import 'screens/notification/notification_screen.dart';
import 'screens/issue_report_screen/issue_report_screen.dart';
import 'screens/curriculum/calendar_curriculum_screen.dart';
import 'constant.dart';

class ScreenController {
  bool isLogin = true;

  getPage(ScreenIndex screenIndex) {
    if (screenIndex == ScreenIndex.curriculum) {
      return const BasicCurriculumScreen();
    } else if (screenIndex == ScreenIndex.account) {
      return const AccountScreen();
    } else if (screenIndex == ScreenIndex.note) {
      return const NoteScreen();
    } else if (screenIndex == ScreenIndex.setting) {
      return const SettingScreen();
    } else if (screenIndex == ScreenIndex.notification) {
      return const NotificationScreen();
    } else if (screenIndex == ScreenIndex.issueReport) {
      return const IssueReportScreen();
    } else if (screenIndex == ScreenIndex.logOut) {
      isLogin = false;
    } else if (screenIndex == ScreenIndex.calendar) {
      return const CalendarCurriculumScreen();
    }
  }
}
