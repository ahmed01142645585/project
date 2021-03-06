import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:DGEST/Login_screen.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';
import 'package:DGEST/Student_screens/Notes_student_screen.dart';
import 'Admin_screens/Delete_course_admin_screen.dart';
import 'Doctor_screens/Setting_doctor_screen.dart';
import 'Student_screens/Setting_student_screen.dart';
import 'Student_screens/Tasks_student_screen.dart';
import 'package:DGEST/Student_screens/Notification_student_screen.dart';
import 'Doctor_screens/Doctor_screen.dart';
import 'package:DGEST/Admin_screens/Admin_screen.dart';
import 'package:DGEST/Admin_screens/New_user_admin_screen.dart';
import 'package:DGEST/Admin_screens/Setting_admin_screen.dart';
import 'package:DGEST/Admin_screens/Delete_User_admin_screen.dart';
import 'package:DGEST/Admin_screens/add_course_admin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DGEST());
}

class DGEST extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/home': (context) => StudentScreen(),
          '/note': (context) => NotesStudentScreen(),
          '/tasks': (context) => TaskStudentScreen(),
          '/notification': (context) => NotificationStudentScreen(),
          '/setting': (context) => SettingScreen(),
          //doc
          '/homedoc': (context) => DoctorScreen(),
          '/settingdoc': (context) => SettingDoctorScreen(),
          //admin
          '/homeadmin': (context) => AdminScreen(),
          '/adminnu': (context) => NewUserAdminScreen(),
          '/adminsett': (context) => SettingAdminScreen(),
          '/deleteadmin': (context) => DeleteUserAdminScreen(),
          '/addcourse': (context) => AddCourseAdminScreen(),
          '/deletecourse': (context) => DeleteCourseAdminScreen(),
          //TODO: hnzwd al screens f al application.
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          //TODO: hn3mel al theme bt3 al application hena.
          canvasColor: Colors.black,
          //8yrt lon al appbar
        ));
  }
}
