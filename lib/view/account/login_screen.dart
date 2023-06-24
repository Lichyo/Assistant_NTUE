// ignore_for_file: must_be_immutable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:assistant/constant.dart';
import 'package:assistant/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:assistant/components/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:assistant/services/user_account_api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserAccountApi _userAccountApi = UserAccountApi();
  String email = "";
  String password = "";
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                keyboardType: TextInputType.emailAddress,
                decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Enter your email'),
                onChanged: (value) {
                  email = value;
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
                    onTap: () {
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
              child: RoundedButton(
                color: Colors.lightBlue.shade400,
                title: 'Sign in',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    _userAccountApi.login(email: email, password: password);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Home()));
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    setState(() {
                      Alert(context: context, title: "登入失敗", desc: e.toString())
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
