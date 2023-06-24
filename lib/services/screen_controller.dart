import 'package:assistant/view/lesson_page.dart';
import 'package:assistant/view/note/note_screen.dart';
import 'package:assistant/view/account/account_screen.dart';
import '../view/setting_screen.dart';
import '../view/issue_report_screen.dart';
import '../constant.dart';

class ScreenController {
  bool isLogin = true;

  getPage(ScreenIndex screenIndex) {
    if (screenIndex == ScreenIndex.curriculum) {
      return const LessonPage();
    } else if (screenIndex == ScreenIndex.account) {
      return const AccountScreen();
    } else if (screenIndex == ScreenIndex.note) {
      return const NoteScreen();
    } else if (screenIndex == ScreenIndex.setting) {
      return const SettingScreen();
    } else if (screenIndex == ScreenIndex.issueReport) {
      return IssueReportScreen();
    } else if (screenIndex == ScreenIndex.logOut) {
      isLogin = false;
    } else if (screenIndex == ScreenIndex.calendar) {}
  }
}
