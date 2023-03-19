import 'package:assistant/screens/curriculum/calendar_curriculum_screen.dart';
import 'package:assistant/screens/home_screen.dart';
import 'package:assistant/screens/note/note_screen.dart';
import 'package:assistant/screens/profile/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/note/note_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'testing.dart';
import 'package:flutter/services.dart';
import 'screens/curriculum/basic_curriculum_screen.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
}

class App extends StatelessWidget {
  static const String title = 'Notes SQLite';
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteData(),
      child: MaterialApp(
        title: title,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
