import 'package:DGEST/Doctor_screens/Attendance_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Constins.dart';
import 'package:intl/intl.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:DGEST/Student_screens/Tasks_student_screen.dart';
import 'PDF_doctor_screen.dart';

class SubjectDoctorScreen extends StatefulWidget {
  final String courseID;
  SubjectDoctorScreen({@required this.courseID});
  @override
  _SubjectDoctorScreenState createState() => _SubjectDoctorScreenState();
}

var formatter = new DateFormat.MMMMd().format(now);

class _SubjectDoctorScreenState extends State<SubjectDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDoctorColor,
        title: Text(
          '${widget.courseID}',
          style: kAppBarTextStyle,
        ),
        centerTitle: true,
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
        image: 'images/B4.jpeg',
        child: SafeArea(
          child: Column(
            children: [
              WidgetContainers(
                widgetColor: kDoctorColor,
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text(
                        '$formatter',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Container(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              TasksWeekList(
                                taskColor: kDoctorColor,
                                weekNumber: '1',
                                onTap: () {
                                  setState(() {
                                    selectedCard = '1';
                                  });
                                },
                              ),
                              TasksWeekList(
                                taskColor: kDoctorColor,
                                weekNumber: '2',
                                onTap: () {
                                  setState(() {
                                    selectedCard = '2';
                                  });
                                },
                              ),
                              TasksWeekList(
                                taskColor: kDoctorColor,
                                weekNumber: '3',
                                onTap: () {
                                  setState(() {
                                    selectedCard = '3';
                                  });
                                },
                              ),
                              // TasksWeekList(
                              //   weekNumber: '4',
                              //   onTap: () {
                              //     setState(() {
                              //       selectedCard = '4';
                              //     });
                              //   },
                              // ),
                              // TasksWeekList(
                              //   weekNumber: '5',
                              //   onTap: () {
                              //     setState(() {
                              //       selectedCard = '5';
                              //     });
                              //   },
                              // ),
                              // TasksWeekList(
                              //   weekNumber: '6',
                              //   onTap: () {
                              //     setState(() {
                              //       selectedCard = '6';
                              //     });
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Text(
              //   'Compiler',
              //   style: TextStyle(
              //     fontSize: 25.0,
              //     color: Colors.black,
              //   ),
              // ),
              // Expanded(
              //   child: Container(
              //     height: MediaQuery.of(context).size.height,
              //     child: Padding(
              //       padding: EdgeInsets.all(10.0),
              //       child: ListView(
              //         children: <Widget>[
              //           Tasks(task: 'sheet 1'),
              //           Tasks(task: 'sheet 2'),
              //           Tasks(task: 'sheet 3'),
              //           Tasks(task: 'sheet 4'),
              //           Tasks(task: 'sheet 5'),
              //           Tasks(task: 'sheet 6'),
              //           Tasks(task: 'sheet 7'),
              //           Tasks(task: 'sheet 8'),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              WidgetContainers(
                widgetColor: kDoctorColor,
                height: MediaQuery.of(context).size.height / 12,
                child: Center(
                  child: Text('PDF Files', style: kTextStyle),
                ),
                onTap: () {
                  //Navigator.pushNamed(context, '/tasksdoc');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFDoctorScreen(
                        courseID: widget.courseID,
                      ),
                    ),
                  );
                },
              ),
              // WidgetContainers(
              //   height: MediaQuery.of(context).size.height / 12,
              //   child: Center(
              //     child: Text('SECTION', style: kSubjectScreenButtonsTextStyle),
              //   ),
              // ),
              // WidgetContainers(
              //   height: MediaQuery.of(context).size.height / 12,
              //   child: Center(
              //     child: Text('LAB', style: kSubjectScreenButtonsTextStyle),
              //   ),
              // ),
              WidgetContainers(
                widgetColor: kDoctorColor,
                height: MediaQuery.of(context).size.height / 12,
                child: Center(
                  child: Text('Attendance', style: kTextStyle),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendanceDoctorScreen(
                        courseName: widget.courseID,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
