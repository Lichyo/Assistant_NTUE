import 'package:assistant/view/home_screen.dart';
import 'package:assistant/view/issue_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'services/notification_api.dart';
import 'testing.dart';
import 'view/account/account_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Firebase.initializeApp();
  NotificationApi().initNotification();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Home(),
      home: IssueReportScreen(),
      // home: AccountScreen(),
    );
  }
}
