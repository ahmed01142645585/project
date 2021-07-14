import 'package:DGEST/Constins.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddCourseAdminScreen extends StatefulWidget {
  @override
  _AddCourseAdminScreenState createState() => _AddCourseAdminScreenState();
}

class _AddCourseAdminScreenState extends State<AddCourseAdminScreen> {
  final _fireStore = FirebaseFirestore.instance;
  int courseLevel;
  int courseHours;
  int courseHall;
  String courseName;
  String courseCode;
  String courseDay = 'Sunday';
  List<DropdownMenuItem<String>> weekDays = [
    DropdownMenuItem(
      child: Text('Sunday'),
      value: 'Sunday',
    ),
    DropdownMenuItem(
      child: Text('Monday'),
      value: 'Monday',
    ),
    DropdownMenuItem(
      child: Text('Tuesday'),
      value: 'Tuesday',
    ),
    DropdownMenuItem(
      child: Text('Wednesday'),
      value: 'Wednesday',
    ),
    DropdownMenuItem(
      child: Text('Thursday'),
      value: 'Thursday',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAdminColor,
        centerTitle: true,
        title: Text(
          'Add Course',
          style: kAppBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0.0,
      ),
      body: BackgroundImage(
        image: 'images/B2.jpeg',
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Enter Course Information',
                textAlign: TextAlign.center,
                style: kTextNoBackground,
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'Name',
                onChange: (value) {
                  courseName = value;
                },
              ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'Code',
                onChange: (value) {
                  courseCode = value;
                },
              ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'Course Hall',
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChange: (value) {
                  courseHall = int.parse(value);
                },
              ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'Level',
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChange: (value) {
                  courseLevel = int.parse(value);
                },
              ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'Hours',
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChange: (value) {
                  courseHours = int.parse(value);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Course Day',
                style: kTextNoBackground,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: DropdownButton(
                  style: TextStyle(fontSize: 25.0),
                  dropdownColor: kAdminColor,
                  icon: Icon(Icons.arrow_drop_down_circle),
                  isExpanded: true,
                  iconSize: 25.0,
                  value: courseDay,
                  items: weekDays,
                  onChanged: (value) {
                    setState(() {
                      courseDay = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: ButtonsForDGEST(
                  buttonColor: kAdminColor,
                  buttonText: 'Add Course',
                  onPress: () {
                    if (courseName != null &&
                        courseCode != null &&
                        courseHall != null &&
                        courseDay != null &&
                        courseLevel != null &&
                        courseHours != null) {
                      _fireStore.collection('Courses').doc('$courseName').set({
                        'code': courseCode.toUpperCase(),
                        'level': courseLevel,
                        'hours': courseHours,
                        'day': courseDay,
                        'hall': courseHall,
                        'doctor': ''
                      });
                      final messageBar = SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(
                            bottom: 50.0, left: 20.0, right: 20.0),
                        backgroundColor: kAdminColor,
                        content: Text(
                          'New Course Added Successfully',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                          ),
                        ),
                        duration: Duration(seconds: 10),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(messageBar);
                      Navigator.pop(context);
                    } else {
                      Alert(
                        context: context,
                        style: alertStyle,
                        title: 'Please Make sure to Add all Course Data.',
                      ).show();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
