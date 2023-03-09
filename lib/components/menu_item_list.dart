import 'package:flutter/material.dart';
import 'package:assistant/components/menu_item.dart';

class MenuItemList {
  List<Widget> menuItemList = [
    const MenuItem(
      text: 'Profile',
      icon: Icons.person,
    ),
    const MenuItem(
      text: 'Curriculum',
      icon: Icons.list,
    ),
    const MenuItem(
      text: 'Note',
      icon: Icons.book_rounded,
    ),
    const Divider(height: 50),
    const MenuItem(
      text: 'Setting',
      icon: Icons.settings,
    ),
    const MenuItem(
      text: 'Notification',
      icon: Icons.notifications,
    ),
    const MenuItem(
      text: 'Issue Report',
      icon: Icons.feedback_outlined,
    ),
  ];

  var menuItemIndex = <String , int> {
    'Profile' : 0,
    'Curriculum' : 1,
    'Note' : 2,
    'Setting' : 4,
    'Notification' : 5,
    'Issue Report' : 6,
  };

}