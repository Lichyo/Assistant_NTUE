import 'package:flutter/material.dart';

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w700,
  color: Colors.lightBlue,
  fontFamily: 'Ubuntu',
);

const kAppBarTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
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

const kNoteTitleTextStyle = TextStyle(
  fontSize: 23.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

const kNoteDescriptionTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 15.0,
  color: Colors.grey,
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldTextStyle = TextStyle(
  color: Colors.black,
);
enum ScreenIndex {curriculum, account, note, setting, notification, issueReport, logOut, calendar}
