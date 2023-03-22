import 'package:assistant/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'screens/chat/chat_screen.dart';

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
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // themeMode: ThemeMode.dark,
      // theme: ThemeData(
      //   primaryColor: Colors.black,
      //   scaffoldBackgroundColor: Colors.white,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
