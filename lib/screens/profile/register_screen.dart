// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:assistant/constant.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  late String ID;
  late String password;
  late String name;
  late String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                'Register',
                style: kTitleTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            child: TextField(
              onChanged: (value){
                name = value;
              },
                decoration:
                    kTextFieldDecoration.copyWith(labelText: 'Enter your name'),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            child: TextField(
              onChanged: (value){
                ID = value;
              },
              decoration:
              kTextFieldDecoration.copyWith(labelText: 'Enter your ID'),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            child: TextField(
              onChanged: (value){
                email = value;
              },
              decoration:
              kTextFieldDecoration.copyWith(labelText: 'Enter your email'),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            child: TextField(
              onChanged: (value){
                password = value;
              },
              decoration:
              kTextFieldDecoration.copyWith(labelText: 'Enter your password'),),
          ),

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: ElevatedButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0,
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(Colors.lightBlue),
              ),
              onPressed: () {
                
              },
              child: const Text(
                'Submit',
                style: kButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
