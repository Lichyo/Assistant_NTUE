import 'package:assistant/services/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:assistant/components/draw_header.dart';
import 'package:assistant/components/menu_item.dart';
import 'package:assistant/view/account/account_screen.dart';
import 'package:assistant/constant.dart';
import 'package:assistant/services/user_account_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final UserAccountApi _userAccountApi = UserAccountApi();
  final ScreenController _screenController = ScreenController();
  ScreenIndex _selectedPage = ScreenIndex.account;

  @override
  void initState() {
    super.initState();
    checkIsUserLoginAndSetScreenIndex();
  }

  void checkIsUserLoginAndSetScreenIndex() {
    if (_userAccountApi.isUserLogin()) {
      setState(() {
        _selectedPage = ScreenIndex.curriculum;
      });
    } else {
      setState(() {
        _selectedPage = ScreenIndex.account;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_selectedPage != ScreenIndex.account)
          ? AppBar(
              title: const Text(
                'NTUE Assistant',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawHeader(),
              Column(
                children: [
                  MenuItem(
                    text: 'Lesson',
                    icon: Icons.list,
                    onPressed: () {
                      setState(() {
                        _selectedPage = ScreenIndex.curriculum;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  MenuItem(
                    text: 'Note',
                    icon: Icons.book_rounded,
                    onPressed: () {
                      setState(() {
                        _selectedPage = ScreenIndex.note;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  const Divider(height: 30),
                  MenuItem(
                    text: 'Setting',
                    icon: Icons.settings,
                    onPressed: () {
                      setState(() {
                        _selectedPage = ScreenIndex.setting;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  MenuItem(
                    text: 'Issue Report',
                    icon: Icons.feedback_outlined,
                    onPressed: () {
                      setState(() {
                        _selectedPage = ScreenIndex.issueReport;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  MenuItem(
                    icon: Icons.login_rounded,
                    text: 'Log out',
                    onPressed: () {
                      setState(() {
                        _userAccountApi.logout();
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
      body: _screenController.getPage(_selectedPage),
    );
  }
}
