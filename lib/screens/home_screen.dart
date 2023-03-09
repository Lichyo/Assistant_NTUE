import 'package:assistant/models/curriculum/curriculum.dart';
import 'package:assistant/screens/profile/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:assistant/components/draw_header.dart';
import 'package:assistant/components/menu_item.dart';
import 'package:assistant/screens/curriculum/basic_curriculum_screen.dart';
import 'package:assistant/screens/note/note_screen.dart';
import 'package:assistant/screens/setting/setting_screen.dart';
import 'package:assistant/models/curriculum/class_data.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  ClassData classData = ClassData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.calendar_month,
              size: 30,
            ),
          ),
        ],
        title: const Text(
          'NTUE Assistant',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const DrawHeader(),
              MenuItem(
                text: 'Profile',
                icon: Icons.person,
                navigateCallBack: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AccountScreen()));
                },
              ),
              MenuItem(
                text: 'Curriculum',
                icon: Icons.list,
                navigateCallBack: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
              ),
              MenuItem(
                text: 'Note',
                icon: Icons.book_rounded,
                navigateCallBack: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NoteScreen()));
                },
              ),
              const Divider(height: 50),
              MenuItem(
                text: 'Setting',
                icon: Icons.settings,
                navigateCallBack: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingScreen()));
                },
              ),
              MenuItem(
                text: 'Notification',
                icon: Icons.notifications,
                navigateCallBack: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AccountScreen()));
                },
              ),
              MenuItem(
                text: 'Issue Report',
                icon: Icons.feedback_outlined,
                navigateCallBack: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AccountScreen()));
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          Expanded(
            child: NoteScreen(),
          ),
        ],
      ),
    );
  }
}
