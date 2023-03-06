import 'package:flutter/material.dart';
import 'package:assistant/constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage(
                  'lib/images/NTUE.png',
                ),
                height: 90.0,
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                'Login',
                style: kTitleTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 5.0,
            ),
            child: TextField(
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your ID'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 30.0,
            ),
            child: TextField(
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
            ),
          ),
        ],
      ),
    );
  }
}
