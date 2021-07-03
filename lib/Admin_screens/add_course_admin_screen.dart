import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Login_screen.dart';

class AddCourseAdminScreen extends StatefulWidget {
  @override
  _AddCourseAdminScreenState createState() => _AddCourseAdminScreenState();
}

class _AddCourseAdminScreenState extends State<AddCourseAdminScreen> {
  final _fireStore = FirebaseFirestore.instance;
  int courseLevel;
  int courseHours;
  String courseName;
  String courseCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
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
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Enter Course Information',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.black),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFiledLogIn(
                hideText: false,
                hintText: 'Name',
                onChange: (value) {
                  courseName = value;
                },
              ),
              TextFiledLogIn(
                hideText: false,
                hintText: 'Code',
                onChange: (value) {
                  courseCode = value;
                },
              ),
              TextFiledLogIn(
                hideText: false,
                hintText: 'Level',
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChange: (value) {
                  courseLevel = int.parse(value);
                },
              ),
              TextFiledLogIn(
                hideText: false,
                hintText: 'Hours',
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChange: (value) {
                  courseHours = int.parse(value);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: ButtonLogIn(
                    buttonText: 'Add Course',
                    onPress: () {
                      _fireStore
                          .collection('Courses')
                          .doc('${courseCode.toUpperCase()}')
                          .set({
                        'name': courseName,
                        'level': courseLevel,
                        'hours': courseHours,
                        'doctor': ''
                      });
                      final messageBar = SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(
                            bottom: 50.0, left: 20.0, right: 20.0),
                        backgroundColor: Color(0xFF06D6A0),
                        content: Text(
                          'New Course Added Successfully',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                          ),
                        ),
                        duration: Duration(seconds: 5),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(messageBar);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
