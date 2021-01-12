import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';
import 'package:DGEST/Login_screen.dart';
import 'package:DGEST/Constins.dart';

class NotesStudentScreen extends StatefulWidget {
  @override
  _NotesStudentScreenState createState() => _NotesStudentScreenState();
}

class _NotesStudentScreenState extends State<NotesStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Notes'),
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Add new Note.',
                    style: kHSSMainListTextStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        print('Button is pressed!');
                      },
                    ),
                  ),
                ],
              ),
              ButtonLogIn(
                buttonText: 'Add New Note',
                onPress: () {
                  print('button is pressed!');
                },
                buttonPadding: EdgeInsets.symmetric(horizontal: 50.0),
              ),
              Expanded(
                child: WidgetContainers(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            height: 75,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            height: 75,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
