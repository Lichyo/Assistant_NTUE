import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'models/curriculum/class_data.dart';
import 'package:http/http.dart';

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
              var data = await get(Uri.parse('https://raw.githubusercontent.com/Lichyo/Assistant_NTUE/main/lib/assets/OUTPUT.json?token=GHSAT0AAAAAAB36P22MW6DIUGZDKQYPUH4MZCUSGHA'));
              var map = jsonDecode(data.body);
              ClassData classData = ClassData(file: map, id: '111016041');
              for(int i = 0; i < ClassData.curriculums.length; i++) {
                print(ClassData.curriculums[i].subject);
              }
            },
            child: const Text('Testing Button'),
          ),
        ],
      ),
    );
  }
}
