import 'package:flutter/material.dart';
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';

class HomeStudentScreen extends StatefulWidget {
  @override
  _HomeStudentScreenState createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: 'images/sora5a.jpeg',
      child: SafeArea(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        'Hello,Gehad!',
                        style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Have a nice day !',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 37,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        print('search icon is pressed!');
                      }),
                ],
              ),
            ),
            Expanded(
              child: WidgetContainers(
                width: 200,
                onTap: () {},
                child: Center(
                  child: Text(
                    'Attendance',
                    style: kHSSMainButtonsTextStyle,
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: WidgetContainers(
            //     width: 200,
            //     onTap: () {},
            //     child: Center(
            //       child: Text(
            //         'Tasks',
            //         style: kHSSMainButtonsTextStyle,
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: WidgetContainers(
                width: 200,
                onTap: () {
                  Navigator.pushNamed(context, '/note');
                },
                child: Center(
                  child: Text(
                    'Notes',
                    style: kHSSMainButtonsTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  //TODO: al mfrod hena de tsht8l firebase w backend 3shan t3mel al widget de. (Feh t2rebn for loop f 7ta de).
                  WidgetContainers(
                    onTap: () {},
                    width: 220,
                    child: ListDesign(
                      drText: 'Lamiaa Hassan',
                      courseText: 'Compiler',
                      yearSemster: 'Forth Year,\nFirst semster.',
                    ),
                  ),
                  WidgetContainers(
                    onTap: () {},
                    width: 220,
                    child: ListDesign(
                      drText: 'Abo El-ela',
                      courseText: 'Expert System',
                      yearSemster: 'Forth Year,\nFirst semster.',
                    ),
                  ),
                  WidgetContainers(
                    onTap: () {},
                    width: 220,
                    child: ListDesign(
                      drText: 'Abbas Rostm',
                      courseText: 'Image Prossesing',
                      yearSemster: 'Forth Year,\nFirst semster.',
                    ),
                  ),
                  WidgetContainers(
                    onTap: () {},
                    width: 220,
                    child: ListDesign(
                      drText: 'Sherif Mohram',
                      courseText: 'Computer Network',
                      yearSemster: 'Forth Year,\nFirst semster.',
                    ),
                  ),
                  WidgetContainers(
                    onTap: () {},
                    width: 220,
                    child: ListDesign(
                      drText: 'AbdelFatah',
                      courseText: 'Modeling & Simulation',
                      yearSemster: 'Forth Year,\nFirst semster.',
                    ),
                  ),
                  WidgetContainers(
                    onTap: () {},
                    width: 220,
                    child: ListDesign(
                      drText: 'Lamiaa Hassan',
                      courseText: 'Compiler',
                      yearSemster: 'Forth Year,\nFirst semster.',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
