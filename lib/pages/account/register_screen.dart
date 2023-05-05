// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:assistant/constant.dart';
import 'package:assistant/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:assistant/components/rounded_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String ID = "";
  String password = "";
  String name = "";
  String email = "";
  bool isObscure = true;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    'lib/images/NTUE.png',
                  ),
                  height: 90.0,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Register',
                  style: kTitleTextStyle.copyWith(color: Colors.blue),
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
                decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Enter your email'),
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
              child: RoundedButton(
                color: Colors.blue.shade600,
                title: 'Sign up',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Home()));
                      setState(() {
                        showSpinner = false;
                      });
                      print('register');
                    }
                  } catch (e) {
                    setState(() {
                      Alert(context: context, title: "註冊失敗", desc: e.toString())
                          .show();
                      showSpinner = false;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}