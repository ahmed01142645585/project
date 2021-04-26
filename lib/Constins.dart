import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

const kHSSMainButtonsTextStyle =
    TextStyle(fontFamily: 'Lobster', fontSize: 25.0, color: Colors.black54);
const kHSSMainListTextStyle = TextStyle(fontSize: 20.0, color: Colors.black54);
const supportButtonHeadTitleTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const supportButtonTitleTextStyle =
    TextStyle(color: Colors.black, fontSize: 20);
const kSubjectScreenButtonsTextStyle =
    TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold);
