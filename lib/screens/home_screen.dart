import 'package:assistant/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:assistant/components/draw_header.dart';
import 'package:assistant/screens/note/note_screen.dart';
import 'package:assistant/models/curriculum/class_data.dart';
import 'package:assistant/components/menu_item_list.dart';
import 'package:provider/provider.dart';
import 'package:assistant/screen_controller.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ClassData classData = ClassData();
  MenuItemList menuItemList = MenuItemList();
  ScreenController screenController = ScreenController();

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
              MenuItemList(),
            ],
          ),
        ),
      ),
      body: Provider.of<ScreenController>(context).getPage(),
    );
  }
}