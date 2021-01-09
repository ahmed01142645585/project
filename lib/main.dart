import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:DGEST/Login_screen.dart';
import 'package:DGEST/Student_screens/Home_student_screen.dart';
import 'package:DGEST/Student_screens/Notes_student_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DGEST());
}

class DGEST extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeStudentScreen(),
          '/note': (context) => NotesStudentScreen(),
          //TODO: hnzwd al screens f al application.
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          //TODO: hn3mel al theme bt3 al application hena.
          primaryColor: Color(0xFF06D6A0), //8yrt lon al appbar
        ));
  }
}
