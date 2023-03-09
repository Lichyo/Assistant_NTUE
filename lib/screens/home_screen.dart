import 'package:flutter/material.dart';
import 'package:assistant/components/draw_header.dart';
import 'package:assistant/screens/note/note_screen.dart';
import 'package:assistant/models/curriculum/class_data.dart';
import 'package:assistant/components/menu_item_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  // ClassData classData = ClassData();

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
              Column(children: MenuItemList().menuItemList),
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
