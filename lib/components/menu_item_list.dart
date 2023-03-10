import 'package:flutter/material.dart';
import 'package:assistant/screen_controller.dart';

class MenuItemList extends StatefulWidget {
  MenuItemList({Key? key}) : super(key: key);

  @override
  State<MenuItemList> createState() => _MenuItemListState();
}

class _MenuItemListState extends State<MenuItemList> {
  ScreenController screenController = ScreenController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: screenController.menuList,
    );
  }
}
