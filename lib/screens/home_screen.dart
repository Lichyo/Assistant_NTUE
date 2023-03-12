import 'package:assistant/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:assistant/components/draw_header.dart';
import 'package:assistant/components/menu_item_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {}
    } catch (e) {
      print(e);
    }
  }

  int selectedPage = 0;
  ScreenController screenController = ScreenController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        actions: [
          Visibility(
            visible: selectedPage == 0 ? true : false,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                Icons.calendar_month,
                size: 30,
              ),
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
              MenuItemList(
                screenController: screenController,
                callback: (value) {
                  setState(() {
                    selectedPage = value;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: screenController.screenList[selectedPage],
    );
  }
}
