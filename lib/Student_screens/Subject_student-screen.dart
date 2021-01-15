import 'package:DGEST/Student_screens/Student_screen.dart';
import 'package:flutter/material.dart';
import 'Tasks_student_screen.dart';

class SubjectStudentScreen extends StatefulWidget {
  @override
  _SubjectStudentScreenState createState() => _SubjectStudentScreenState();
}

class _SubjectStudentScreenState extends State<SubjectStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Compiler',
          style: TextStyle(fontSize: 30.0),
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
                        'Oct,2020',
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
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'LECTURE',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              WidgetContainers(
                height: MediaQuery.of(context).size.height / 9,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'SECTION',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              WidgetContainers(
                height: MediaQuery.of(context).size.height / 9,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'LAB',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
