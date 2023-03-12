import 'package:flutter/material.dart';

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w700,
  color: Colors.lightBlue,
  fontFamily: 'Ubuntu',
);

const kTextFieldDecoration = InputDecoration(
  labelText: '',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'Ubuntu',
);

const kMenuTextStyle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
);

const kLittleTitleTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,

);

enum Week {mon, tues, wed, thur, fri}
