import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Constins.dart';

class DeleteCourseAdminScreen extends StatefulWidget {
  @override
  _DeleteCourseAdminScreenState createState() =>
      _DeleteCourseAdminScreenState();
}

class _DeleteCourseAdminScreenState extends State<DeleteCourseAdminScreen> {
  final _fireStore = FirebaseFirestore.instance;
  String courseName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAdminColor,
        centerTitle: true,
        title: Text(
          'Delete User',
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
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Text('Enter Course Name to Delete', style: kTextNoBackground),
              SizedBox(
                height: 15.0,
              ),
              TextFieldForDGEST(
                hintText: 'Name',
                hideText: false,
                onChange: (value) {
                  courseName = value;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              ButtonsForDGEST(
                buttonColor: kAdminColor,
                buttonText: 'Delete User',
                onPress: () {
                  if (courseName != null) {
                    _fireStore
                        .collection('Courses')
                        .doc('$courseName')
                        .delete();
                    final messageBar = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                          bottom: 50.0, left: 20.0, right: 20.0),
                      backgroundColor: kAdminColor,
                      content: Text(
                        'Course has been Deleted Successfully',
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
                      title: 'Please Make sure to Add Course Name.',
                    ).show();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
