import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final _auth = FirebaseAuth.instance;
User loggedInUSer;
String selectedCard = '1';
DateTime now = DateTime.now();
void getUser() async {
  try {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUSer = user;
    }
  } catch (e) {
    print(e);
  }
}

var alertStyle = AlertStyle(
  backgroundColor: Colors.white,
  animationType: AnimationType.grow,
  isCloseButton: true,
  //isOverlayTapDismiss: false,
  descTextAlign: TextAlign.start,
  isButtonVisible: false,
  alertAlignment: Alignment.center,
  animationDuration: Duration(milliseconds: 200),

  // alertBorder: RoundedRectangleBorder(
  //   borderRadius: BorderRadius.circular(50.0),
  // ),
);

//////////////////////////////////////////////////////////////////////////
const kAdminColor = Color(0xFFD69F7E);
const kStudentColor = Color(0xFF89C2D9);
const kDoctorColor = Color(0xFF985277);
const kLoginColor = Color(0xFF70A9A1);
const kTextStyleColor = Colors.black54;
const kTextStyle =
    TextStyle(fontFamily: 'Lobster', fontSize: 25.0, color: Colors.black54);
const kTextNoBackground = TextStyle(fontFamily: 'Lobster', fontSize: 25.0);
const kNiceDayTextStyle = TextStyle(fontFamily: 'Lobster', fontSize: 22.0);
const kAppBarTextStyle =
    TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'Lobster');
//////////////////////////////////////////////////////////////////////////
const kSupportButtonHeadTitleTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const kSupportButtonTitleTextStyle =
    TextStyle(color: Colors.black, fontSize: 20);
