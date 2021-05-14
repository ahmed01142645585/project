import 'package:flutter/material.dart';
import 'Tasks_student_screen.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:intl/intl.dart';
import 'package:DGEST/Constins.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectStudentScreen extends StatefulWidget {
  String courseID;
  SubjectStudentScreen({@required this.courseID});
  @override
  _SubjectStudentScreenState createState() => _SubjectStudentScreenState();
}

var formatter = new DateFormat.MMMMd().format(now);

class _SubjectStudentScreenState extends State<SubjectStudentScreen> {
  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.courseID}',
          style: TextStyle(fontSize: 20.0),
        ),
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
          child: Column(
            children: [
              WidgetContainers(
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
                                weekNumber: '1',
                                onTap: () {
                                  setState(() {
                                    selectedCard = '1';
                                  });
                                },
                              ),
                              TasksWeekList(
                                weekNumber: '2',
                                onTap: () {
                                  setState(() {
                                    selectedCard = '2';
                                  });
                                },
                              ),
                              TasksWeekList(
                                weekNumber: '3',
                                onTap: () {
                                  setState(() {
                                    selectedCard = '3';
                                  });
                                },
                              ),
                              TasksWeekList(
                                weekNumber: '4',
                                onTap: () {
                                  setState(() {
                                    selectedCard = '4';
                                  });
                                },
                              ),
                              TasksWeekList(
                                weekNumber: '5',
                                onTap: () {
                                  setState(() {
                                    selectedCard = '5';
                                  });
                                },
                              ),
                              TasksWeekList(
                                weekNumber: '6',
                                onTap: () {
                                  setState(() {
                                    selectedCard = '6';
                                  });
                                },
                              ),
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
                height: MediaQuery.of(context).size.height / 9,
                child: Center(
                  child:
                      Text('PDF Files', style: kSubjectScreenButtonsTextStyle),
                ),
              ),
              // WidgetContainers(
              //   height: MediaQuery.of(context).size.height / 9,
              //   child: Center(
              //     child: Text('SECTION', style: kSubjectScreenButtonsTextStyle),
              //   ),
              // ),
              // WidgetContainers(
              //   height: MediaQuery.of(context).size.height / 9,
              //   child: Center(
              //     child: Text('LAB', style: kSubjectScreenButtonsTextStyle),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class GetUserName extends StatelessWidget {
  GetUserName(this.documentId);
  final String documentId;

  final _fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fireStore
          .collection('Students')
          .doc(documentId)
          .collection('Courses')
          .doc('O0SwAYY5hqe1jUItPR4t')
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.hasData) {
          final data = snapshot.data.data();
          List field = data['subject'];
          return Text(
            '${field.elementAt(1)}',
            style: TextStyle(
              fontSize: 25,
            ),
          );
        }

        return Text(
          'loading',
          style: TextStyle(
            fontSize: 25,
          ),
        );
      },
    );
  }
}
