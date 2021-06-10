import 'package:flutter/material.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:DGEST/Login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'addstudent_admin_screen.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

class NewUserAdminScreen extends StatefulWidget {
  @override
  _NewUserAdminScreenState createState() => _NewUserAdminScreenState();
}

class _NewUserAdminScreenState extends State<NewUserAdminScreen> {
  String theEmail;
  String thePassword;
  String newValue = 'student';
  final _fireStore = FirebaseFirestore.instance;

  // var alertStyle = AlertStyle(
  //   backgroundColor: Color(0xFF06D6A0),
  //   animationType: AnimationType.fromBottom,
  //   isCloseButton: true,
  //   isOverlayTapDismiss: false,
  //   descTextAlign: TextAlign.start,
  //   isButtonVisible: false,
  //   animationDuration: Duration(milliseconds: 400),
  //   alertBorder: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(50.0),
  //   ),
  //   titleStyle: TextStyle(
  //     color: Colors.black,
  //   ),
  //   alertAlignment: Alignment.bottomCenter,
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New User'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0.0,
      ),
      body: BackgroundImage(
        image: 'images/sora5a.jpeg',
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'Enter New User Information',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  TextFiledLogIn(
                    hintText: 'Email',
                    hideText: false,
                    onChange: (value) {
                      theEmail = value;
                    },
                  ),
                  TextFiledLogIn(
                    hintText: 'Password',
                    hideText: true,
                    onChange: (value) {
                      thePassword = value;
                    },
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'Select New User Role',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: DropdownButton(
                      style: TextStyle(fontSize: 25.0),
                      dropdownColor: Color(0xFF06D6A0),
                      icon: Icon(Icons.arrow_drop_down_circle),
                      isExpanded: true,
                      iconSize: 25.0,
                      value: newValue,
                      items: [
                        DropdownMenuItem(
                          child: Text('student'),
                          value: 'student',
                        ),
                        DropdownMenuItem(
                          child: Text('doctor'),
                          value: 'doctor',
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          newValue = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  ButtonLogIn(
                    buttonText: 'Add User',
                    onPress: () async {
                      try {
                        final newUser = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: theEmail, password: thePassword);
                        if (newUser != null) {
                          _fireStore
                              .collection('UserRoles')
                              .doc('$theEmail')
                              .set({'role': '$newValue'});
                          final messageBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                                bottom: 50.0, left: 20.0, right: 20.0),
                            backgroundColor: Color(0xFF06D6A0),
                            content: Text(
                              'User Added Successfully',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.black,
                              ),
                            ),
                            duration: Duration(seconds: 3),
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(messageBar);
                          // Alert(
                          //   context: context,
                          //   style: alertStyle,
                          //   title: "New User Added Successfully.",
                          // ).show();
                          if (newValue == 'student') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddNewStudentAdminScreen(
                                  studentEmail: theEmail,
                                ),
                              ),
                            );
                          } else {
                            print('a7a');
                          }
                        }
                      } on FirebaseAuthException catch (e) {
                        print(e);
                      }
                    },
                    buttonPadding: EdgeInsets.symmetric(horizontal: 100.0),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
