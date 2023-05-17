import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Dark Mode',
                style: GoogleFonts.getFont('Ubuntu', fontSize: 30.0),
              ),
              Checkbox(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
