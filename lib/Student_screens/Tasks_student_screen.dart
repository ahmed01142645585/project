import 'package:flutter/material.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';
import 'package:intl/intl.dart';

//import 'package:DGEST/Constins.dart';
var selectedCard = '1';

class TaskStudentScreen extends StatefulWidget {
  @override
  _TaskStudentScreenState createState() => _TaskStudentScreenState();
}

DateTime now = DateTime.now();
var formatter = new DateFormat.yMMMMEEEEd().format(now);

class _TaskStudentScreenState extends State<TaskStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: 'images/sora5a.jpeg',
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Center(
                child: Text(
                  '$formatter',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(
              height: 10,
              thickness: 3.0,
              color: Colors.black45,
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    // Container(
                    //   height: 100,
                    //   margin: EdgeInsets.all(10.0),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15.0),
                    //     color: Colors.white,
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         'Compiler - sheet 1 - lec',
                    //         style:
                    //             TextStyle(fontSize: 20.0, color: Colors.black),
                    //       ),
                    //       Text(
                    //         '5 days left.',
                    //         style:
                    //             TextStyle(fontSize: 17.0, color: Colors.black),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    WidgetContainers(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Compiler - Sheet 1 - Lecture',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '5 days left.',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    WidgetContainers(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Image Processing - Report - Section',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '2 days left.',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
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
