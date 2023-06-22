import 'package:assistant/view/lesson/lesson_page.dart';
import 'package:assistant/view/note/note_screen.dart';
import 'package:assistant/view/account/account_screen.dart';
import 'view/setting/setting_screen.dart';
import 'view/notification/notification_screen.dart';
import 'view/issue_report_screen/issue_report_screen.dart';
import 'constant.dart';

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
    } else if (screenIndex == ScreenIndex.notification) {
      return const NotificationScreen();
    } else if (screenIndex == ScreenIndex.issueReport) {
      return const IssueReportScreen();
    } else if (screenIndex == ScreenIndex.logOut) {
      isLogin = false;
    } else if (screenIndex == ScreenIndex.calendar) {
    }
  }
}
