import 'package:DGEST/Constins.dart';
import 'package:flutter/material.dart';
import 'Home_doctor_screen.dart';
import 'Setting_doctor_screen.dart';

class DoctorScreen extends StatefulWidget {
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  int selectedIndex = 0;
  List<Widget> pages;
  Widget currentPage;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    Widget home = HomeDoctorScreen();
    //Widget task = TasksDoctorScreen();
    Widget setting = SettingDoctorScreen();
    pages = [home, setting];
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
        selectedItemColor: kDoctorColor,
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.assignment),
          //   label: 'Tasks',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
