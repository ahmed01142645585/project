import 'package:DGEST/Constins.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Admin_screens/Home_admin_screen.dart';
import 'package:DGEST/Admin_screens/Setting_admin_screen.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int selectedIndex = 0;
  List<Widget> pages;
  Widget currentPage;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    Widget home = HomeAdminScreen();
    Widget setting = SettingAdminScreen();
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
        selectedItemColor: kAdminColor,
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
