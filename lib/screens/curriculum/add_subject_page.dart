import 'package:flutter/material.dart';
import 'package:assistant/constant.dart';

class AddSubjectPage extends StatelessWidget {
  const AddSubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Subject'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            style: kTextFieldTextStyle,
          ),
        ],
      ),
    );
  }
}
