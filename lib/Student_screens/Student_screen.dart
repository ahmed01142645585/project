import 'package:flutter/material.dart';
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Student_screens/Tasks_student_screen.dart';
import 'package:DGEST/Student_screens/Home_student_screen.dart';
import 'Setting_student_screen.dart';
import 'Notification_student_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentScreen extends StatefulWidget {
  // static const String id = '';
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  int selectedIndex = 0;
  List<Widget> pages;
  Widget currentPage;
  final PageStorageBucket bucket = PageStorageBucket();

  final _auth = FirebaseAuth.instance;
  //@deprecated
  FirebaseUser loggedInUSer;

  @override
  void initState() {
    Widget home = HomeStudentScreen();
    Widget task = TaskStudentScreen();
    Widget setting = SettingScreen();
    //TODO: hnzwd al 2 screens hena al notification w al setting 3shan al bar.
    pages = [home, task, setting];
    currentPage = home;
    super.initState();
    getUser();
  }

  void getUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUSer = user;
        print(loggedInUSer.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentPage),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        //backgroundColor: Colors.transparent,
        selectedItemColor: Color(0xFF06D6A0),
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
      ),
    );
  }
}

class ListDesign extends StatelessWidget {
  ListDesign(
      {@required this.drText,
      @required this.courseText,
      @required this.yearSemster});
  final String drText;
  final String courseText;
  final String yearSemster;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Text(
              drText,
              style: kHSSMainListTextStyle,
            )
          ],
        ),
        Text(
          courseText,
          style: kHSSMainListTextStyle,
        ),
        Text(
          yearSemster,
          style: kHSSMainListTextStyle,
        )
      ],
    );
  }
}

//TODO: lazem nshof trea2a nzbt feha al classes ale bst3melha f aktr mn screen w a5le feh fr2 ben al frontend w al backend.
class WidgetContainers extends StatelessWidget {
  WidgetContainers({this.width, this.onTap, this.child});
  final double width;
  final Function onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(13.0),
        width: width,
        decoration: BoxDecoration(
          color: Color(0xFF06D6A0),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}

//TODO: n8yr mkan al class da 3shan hns3mlo fkol 7ata b3den.
class BackgroundImage extends StatelessWidget {
  BackgroundImage({@required this.image, @required this.child});
  final String image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
