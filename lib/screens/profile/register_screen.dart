// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:assistant/constant.dart';
import 'package:assistant/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String ID = "";
  String password = "";
  String name = "";
  String email = "";
  bool isObscure = true;

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
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            child: TextField(
              onChanged: (value) {
                name = value;
              },
              keyboardType: TextInputType.name,
              decoration:
                  kTextFieldDecoration.copyWith(labelText: 'Enter your name'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            child: TextField(
              onChanged: (value) {
                ID = value;
              },
              keyboardType: TextInputType.number,
              decoration:
                  kTextFieldDecoration.copyWith(labelText: 'Enter your ID'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            child: TextField(
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration:
                  kTextFieldDecoration.copyWith(labelText: 'Enter your email'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            child: TextField(
              onChanged: (value) {
                password = value;
              },
              keyboardType: TextInputType.text,
              obscureText: isObscure,
              decoration: kTextFieldDecoration.copyWith(
                labelText: 'Enter your password',
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: const Icon(
                    Icons.remove_red_eye_outlined,
                  ),
                ),
              ),
            ),
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Home()));
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
