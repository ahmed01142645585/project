import 'package:flutter/material.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';

class TasksDoctorScreen extends StatefulWidget {
  @override
  _TasksDoctorScreenState createState() => _TasksDoctorScreenState();
}

class _TasksDoctorScreenState extends State<TasksDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: 'images/sora5a.jpeg',
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Upload PDF"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}
