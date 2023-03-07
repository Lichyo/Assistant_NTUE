import 'package:assistant/constant.dart';
import 'package:assistant/screens/profile/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:assistant/components/draw_header.dart';
import 'package:assistant/components/menu_item.dart';
import 'package:assistant/screens/curriculum/basic_curriculum.dart';
import 'package:assistant/screens/curriculum/calendar_curriculum.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
              MenuItem(text: 'Profile', icon: Icons.person, navigatorPage: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Account()));
              },),
              MenuItem(text: 'Curriculum', icon: Icons.list, navigatorPage: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BasicCurriculum()));
              },),
              MenuItem(text: 'Note', icon: Icons.book_rounded, navigatorPage: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Account()));
              },),
              const Divider(height: 50),
              MenuItem(text: 'Setting', icon: Icons.settings, navigatorPage: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Account()));
              },),
              MenuItem(text: 'Notification', icon: Icons.notifications, navigatorPage: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Account()));
              },),
              MenuItem(text: 'Issue Report', icon: Icons.feedback_outlined, navigatorPage: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Account()));
              },),
            ],
          ),
        ),
      ),
    );
  }
}
