import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Login_screen.dart';
import 'package:DGEST/Student_screens/Home_student_screen.dart';

void main() {
  runApp(DGEST());
}

class DGEST extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/first': (context) => HomeStudentScreen(),
          //TODO: hnzwd al screens f al application.
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            //TODO: hn3mel al theme bt3 al application hena.
            ));
  }
}
