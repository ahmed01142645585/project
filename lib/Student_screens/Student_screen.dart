import 'package:DGEST/Constins.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Student_screens/Tasks_student_screen.dart';
import 'package:DGEST/Student_screens/Home_student_screen.dart';
import 'Setting_student_screen.dart';
import 'Notification_student_screen.dart';

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  int selectedIndex = 0;
  List<Widget> pages;
  Widget currentPage;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    Widget home = HomeStudentScreen();
    Widget task = TaskStudentScreen();
    Widget notification = NotificationStudentScreen();
    Widget setting = SettingScreen();
    pages = [home, task, notification, setting];
    currentPage = home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentPage),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        //backgroundColor: Colors.transparent,
        selectedItemColor: kStudentColor,
        unselectedItemColor: Colors.white,
        iconSize: 30.0,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            currentPage = pages[index];
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
