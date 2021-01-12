import 'package:flutter/material.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';

//import 'package:DGEST/Constins.dart';
var selectedCard = '1';

class TaskStudentScreen extends StatefulWidget {
  @override
  _TaskStudentScreenState createState() => _TaskStudentScreenState();
}

class _TaskStudentScreenState extends State<TaskStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: 'images/sora5a.jpeg',
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: WidgetContainers(
                //width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Oct,2020',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 30.0, bottom: 60.0, right: 7.0, left: 7.0),
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
            ),
            Text(
              'Compiler',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListView(
                    children: <Widget>[
                      Tasks(task: 'sheet 1'),
                      Tasks(task: 'sheet 2'),
                      Tasks(task: 'sheet 3'),
                      Tasks(task: 'sheet 4'),
                      Tasks(task: 'sheet 5'),
                      Tasks(task: 'sheet 6'),
                      Tasks(task: 'sheet 7'),
                      Tasks(task: 'sheet 8'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//   Widget _light_and_of_week(String cardTitle) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           selectedCard = cardTitle;
//         });
//       },
//       child: AnimatedContainer(
//         margin: EdgeInsets.symmetric(horizontal: 5.0),
//         width: 100,
//         duration: Duration(milliseconds: 100),
//         //curve: Curves.easeIn,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15.0),
//           color: cardTitle == selectedCard ? Color(0xFF06D6A0) : Colors.white,
//           border: Border.all(
//               color: Colors.black54, style: BorderStyle.solid, width: 4.0),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Week',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: cardTitle == selectedCard ? Colors.white : Colors.black,
//               ),
//             ),
//             Text(
//               cardTitle,
//               style: TextStyle(
//                   fontSize: 20,
//                   color:
//                       cardTitle == selectedCard ? Colors.white : Colors.black,
//                   fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
}

class TasksWeekList extends StatelessWidget {
  TasksWeekList({this.weekNumber, this.onTap});
  final String weekNumber;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        width: 100,
        duration: Duration(milliseconds: 100),
        //curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: weekNumber == selectedCard ? Color(0xFF06D6A0) : Colors.white,
          border: Border.all(
              color: Colors.black54, style: BorderStyle.solid, width: 4.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Week',
              style: TextStyle(
                fontSize: 20,
                color: weekNumber == selectedCard ? Colors.white : Colors.black,
              ),
            ),
            Text(
              weekNumber,
              style: TextStyle(
                  fontSize: 20,
                  color:
                      weekNumber == selectedCard ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Tasks extends StatelessWidget {
  Tasks({@required this.task, this.onTap});
  final String task;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              task,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            IconButton(
              icon: Icon(Icons.dehaze),
              color: Colors.black,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
