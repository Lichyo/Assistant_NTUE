import 'package:flutter/material.dart';
import 'package:assistant/components/menu_item.dart';
import 'package:assistant/screen_controller.dart';

class MenuItemList extends StatefulWidget {
  ScreenController screenController;
  final Function callback;
  MenuItemList({super.key, required this.screenController, required this.callback});
  @override
  State<MenuItemList> createState() => _MenuItemListState();
}

class _MenuItemListState extends State<MenuItemList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          text: 'Curriculum',
          icon: Icons.list,
          itemCallback: () {
            setState(() {
              widget.callback(0);
            });
          },
        ),
        MenuItem(
          text: 'Profile',
          icon: Icons.person,
          itemCallback: () {
            setState(() {
              widget.callback(1);
            });
          },
        ),
        MenuItem(
          text: 'Note',
          icon: Icons.book_rounded,
          itemCallback: () {
            setState(() {
              widget.callback(2);
            });
          },
        ),
        const Divider(height: 30),
        MenuItem(
          text: 'Setting',
          icon: Icons.settings,
          itemCallback: () {
            setState(() {
              widget.callback(3);
            });
          },
        ),
        MenuItem(
          text: 'Notification',
          icon: Icons.notifications,
          itemCallback: () {
            setState(() {
              widget.callback(4);
            });
          },
        ),
        MenuItem(
          text: 'Issue Report',
          icon: Icons.feedback_outlined,
          itemCallback: () {
            setState(() {
              widget.callback(5);
            });
          },
        ),
      ],
    );
  }
}
