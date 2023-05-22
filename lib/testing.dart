import 'package:flutter/material.dart';
import 'services/notification_api.dart';

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
            onPressed: () async{
              await NotificationApi().showNotification(
                  title: 'Testing Title',
                  body: 'This is so hard to learn',
                  payload: 'so sad, here is no support');
            },
            child: const Text(
              'onPressed',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
