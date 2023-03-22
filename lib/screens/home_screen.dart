import 'package:assistant/screen_controller.dart';
import 'package:assistant/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:assistant/components/draw_header.dart';
import 'package:assistant/components/menu_item_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:assistant/screens/account/account_screen.dart';
import 'package:assistant/constant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user;
  ScreenController screenController = ScreenController();
  ScreenIndex selectedPage = ScreenIndex.curriculum; // default
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  onRefresh(currUser) {
    setState(() {
      user = currUser;
    });
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {}
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        actions: [
          Visibility(
            visible: selectedPage == ScreenIndex.curriculum ? true : false,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedPage = ScreenIndex.calendar;
                });
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
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
                callback: (value) {
                  print(value);

                },
              ),
            ],
          ),
        ),
      ),
      body: user != null
          ? screenController.getPage(selectedPage)
          : const AccountScreen(),
    );
  }
}
