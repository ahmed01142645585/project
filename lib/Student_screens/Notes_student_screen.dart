import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Student_screens/Home_student_screen.dart';
import 'package:DGEST/Constins.dart';

class NotesStudentScreen extends StatefulWidget {
  @override
  _NotesStudentScreenState createState() => _NotesStudentScreenState();
}

class _NotesStudentScreenState extends State<NotesStudentScreen> {
  int selectedIndex = 0;
  //TODO: al mfrod da gy mn home screen mesh yt create gded.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
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
              //TODO: da al mfrod f 7ta w7da bs w ysm3 f aktr mn screen. lo hnndhh aktr mn mra f hn7to f class.
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                selectedItemColor: Color(0xFF06D6A0),
                unselectedItemColor: Colors.white,
                iconSize: 30.0,
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.assignment),
                    title: Text('Tasks'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    title: Text('Notifications'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
