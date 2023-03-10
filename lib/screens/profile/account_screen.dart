import 'package:assistant/screens/profile/login_screen.dart';
import 'package:assistant/screens/profile/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:assistant/constant.dart';
import 'package:assistant/components/rounded_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  'Assistant',
                  style: kTitleTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: RoundedButton(
                color: Colors.lightBlue,
                title: 'Login',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: RoundedButton(
                color: Colors.lightBlue,
                title: 'Register',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
