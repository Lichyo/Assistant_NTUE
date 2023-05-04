import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'models/curriculum/class_data.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () async {
               File('/Users/lichyo/StudioProjects/assistant/lib/OUTPUT.json').readAsString().then((String contents) {
                 var map = json.decode(contents);
                 ClassData classData = ClassData(file: map, id: '111016041');
               });
            },
            child: const Text('Testing Button'),
          ),
        ],
      ),
    );
  }
}
