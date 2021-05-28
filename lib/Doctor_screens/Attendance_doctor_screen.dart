import 'package:flutter/material.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';

class AttendanceDoctorScreen extends StatefulWidget {
  @override
  _AttendanceDoctorScreenState createState() => _AttendanceDoctorScreenState();
}

class _AttendanceDoctorScreenState extends State<AttendanceDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Week 1 Compiler Theory'),
        centerTitle: true,
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
          child: WidgetContainers(
            //width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                  AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//TODO: ana 3mlt al class fdl ba2a nst3melh bdl ale mktob kter fo2 da.
class AttendanceWidget extends StatelessWidget {
  AttendanceWidget(this.studentName, this.studentTime);
  final String studentName;
  final String studentTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              studentName,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              width: 30.0,
            ),
            Text(
              studentTime,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        Divider(
          thickness: 2.0,
          color: Colors.black,
        ),
      ],
    );
  }
}
