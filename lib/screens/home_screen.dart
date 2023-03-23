import 'package:assistant/screen_controller.dart';
import 'package:assistant/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:assistant/components/draw_header.dart';
import 'package:assistant/components/menu_item.dart';
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

  ScreenIndex login() {
    setState(() {
      selectedPage = ScreenIndex.curriculum;
    });
    return selectedPage;
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {}
    } catch (e) {
      print(e);
    }
  }

  ScreenIndex notLogin() {
    setState(() {
      selectedPage = ScreenIndex.account;
    });
    return selectedPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (selectedPage == ScreenIndex.account)
          ? null
          : AppBar(
              backgroundColor: Colors.lightBlue,
              actions: [
                Visibility(
                  visible:
                      selectedPage == ScreenIndex.curriculum ? true : false,
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
              Column(
                children: [
                  MenuItem(
                    text: 'Curriculum',
                    icon: Icons.list,
                    itemCallback: () {
                      setState(() {
                        selectedPage = ScreenIndex.curriculum;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  MenuItem(
                    text: 'Account',
                    icon: Icons.person,
                    itemCallback: () {
                      setState(() {
                        selectedPage = ScreenIndex.account;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  MenuItem(
                    text: 'Note',
                    icon: Icons.book_rounded,
                    itemCallback: () {
                      setState(() {
                        selectedPage = ScreenIndex.note;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  const Divider(height: 30),
                  MenuItem(
                    text: 'Setting',
                    icon: Icons.settings,
                    itemCallback: () {
                      setState(() {
                        selectedPage = ScreenIndex.setting;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  MenuItem(
                    text: 'Notification',
                    icon: Icons.notifications,
                    itemCallback: () {
                      setState(() {
                        selectedPage = ScreenIndex.notification;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  MenuItem(
                    text: 'Issue Report',
                    icon: Icons.feedback_outlined,
                    itemCallback: () {
                      setState(() {
                        selectedPage = ScreenIndex.issueReport;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  MenuItem(
                    icon: Icons.login_rounded,
                    text: 'Log out',
                    itemCallback: () {
                      setState(() {
                        _auth.signOut();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AccountScreen()));
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: user != null
          ? screenController.getPage(selectedPage)
          : screenController.getPage(notLogin()),
    );
  }
}
