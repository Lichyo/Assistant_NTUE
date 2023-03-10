// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:assistant/constant.dart';
import 'package:assistant/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String ID = "";
  String password = "";
  bool isObscure = false;

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
              keyboardType: TextInputType.number,
              decoration:
                  kTextFieldDecoration.copyWith(labelText: 'Enter your ID'),
              onChanged: (value) {
                ID = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 30.0,
            ),
            child: TextField(
              obscureText: isObscure,
              decoration: kTextFieldDecoration.copyWith(
                labelText: 'Enter your password',
                suffix: GestureDetector(
                  onTap: (){
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: const Icon(Icons.remove_red_eye_outlined),
                ),
              ),
              onChanged: (value) {
                password = value;
              },
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
                FocusManager.instance.primaryFocus?.unfocus();
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
