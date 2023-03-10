import 'package:assistant/screens/curriculum/basic_curriculum_screen.dart';
import 'package:assistant/screens/note/note_screen.dart';
import 'package:assistant/screens/profile/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/menu_item.dart';

class ScreenController extends ChangeNotifier{
  static int selectedPage = 0;
  List<Widget> menuList = [];

  List<Widget> screenList = [
    const AccountScreen(),
    const BasicCurriculumScreen(),
    const NoteScreen(),
  ];

  Widget getPage() {
    print('selectedPage = $selectedPage');
    return screenList[selectedPage];
  }

  void itemToggle(int index) {
    selectedPage = index;
    print(selectedPage);
  }

  ScreenController(){
    menuList = [
      MenuItem(
        text: 'Profile',
        icon: Icons.person,
        itemCallback: () {
          itemToggle(0);
        },
      ),
      MenuItem(
        text: 'Curriculum',
        icon: Icons.list,
        itemCallback: () {
          itemToggle(1);
        },
      ),
      MenuItem(
        text: 'Note',
        icon: Icons.book_rounded,
        itemCallback: () {
          itemToggle(2);
        },
      ),
      // const Divider(height: 50),
      MenuItem(
        text: 'Setting',
        icon: Icons.settings,
        itemCallback: () {
          itemToggle(3);
        },
      ),
      MenuItem(
        text: 'Notification',
        icon: Icons.notifications,
        itemCallback: () {
          itemToggle(4);
        },
      ),
      MenuItem(
        text: 'Issue Report',
        icon: Icons.feedback_outlined,
        itemCallback: () {
          itemToggle(5);
        },
      ),
    ];
  }
}
