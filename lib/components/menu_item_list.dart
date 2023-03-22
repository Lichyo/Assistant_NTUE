import 'package:flutter/material.dart';
import 'package:assistant/components/menu_item.dart';
import 'package:assistant/screen_controller.dart';
import 'package:assistant/constant.dart';

class MenuItemList extends StatelessWidget {
  final Function callback;
  const MenuItemList({super.key, required this.callback});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          text: 'Curriculum',
          icon: Icons.list,
          itemCallback: callback(ScreenIndex.curriculum),
        ),
        MenuItem(
          text: 'Account',
          icon: Icons.person,
          itemCallback: callback(ScreenIndex.account),
        ),
        MenuItem(
          text: 'Note',
          icon: Icons.book_rounded,
          itemCallback: callback(ScreenIndex.note),
        ),
        const Divider(height: 30),
        MenuItem(
          text: 'Setting',
          icon: Icons.settings,
          itemCallback: callback(ScreenIndex.setting),
        ),
        MenuItem(
          text: 'Notification',
          icon: Icons.notifications,
          itemCallback: callback(ScreenIndex.notification),
        ),
        MenuItem(
          text: 'Issue Report',
          icon: Icons.feedback_outlined,
          itemCallback: callback(ScreenIndex.issueReport),
        ),
        MenuItem(
          icon: Icons.login_rounded,
          text: 'Log out',
          itemCallback: callback(ScreenIndex.logOut),
        ),
      ],
    );
  }
}
