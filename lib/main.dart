import 'package:assistant/screens/profile/account_screen.dart';
import 'package:assistant/screens/profile/register_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'models/note/note_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/profile/account_screen.dart';
import 'testing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AccountScreen(),
      ),
    );
  }
}
