import 'package:assistant/constant.dart';
import 'package:flutter/material.dart';
import 'package:assistant/components/draw_header.dart';
import 'package:assistant/components/menu_item.dart';

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
            children: const [
              DrawHeader(),
              MenuItem(text: 'Profile', icon: Icons.person),
              MenuItem(text: 'Curriculum', icon: Icons.list),
              MenuItem(text: 'Note', icon: Icons.book_rounded),
              Divider(height: 50),
              MenuItem(text: 'Setting', icon: Icons.settings),
              MenuItem(text: 'Notification', icon: Icons.notifications),
              MenuItem(text: 'Issue Report', icon: Icons.feedback_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
