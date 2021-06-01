import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:DGEST/Login_screen.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';
import 'package:DGEST/Student_screens/Notes_student_screen.dart';
import 'Doctor_screens/Setting_doctor_screen.dart';
import 'Doctor_screens/PDF_doctor_screen.dart';
import 'Student_screens/Setting_student_screen.dart';
import 'Student_screens/Tasks_student_screen.dart';
import 'package:DGEST/Student_screens/Notification_student_screen.dart';
import 'package:DGEST/Student_screens/Subject_student-screen.dart';
import 'Doctor_screens/Doctor_screen.dart';
import 'package:DGEST/Doctor_screens/Subject_doctor_screen.dart';
import 'package:DGEST/Doctor_screens/Attendance_doctor_screen.dart';
import 'package:DGEST/Admin_screens/Admin_screen.dart';
import 'package:DGEST/Admin_screens/Newuser_admin_screen.dart';
import 'package:DGEST/Admin_screens/Setting_admin_screen.dart';
import 'Student_screens/PDF_student_screen.dart';

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
          '/subject': (context) => SubjectStudentScreen(),
          '/setting': (context) => SettingScreen(),
          '/studentpdf': (context) => PDFStudentScreen(),
          //doc
          '/homedoc': (context) => DoctorScreen(),
          '/settingdoc': (context) => SettingDoctorScreen(),
          '/tasksdoc': (context) => PDFDoctorScreen(),
          '/subjectdoc': (context) => SubjectDoctorScreen(),
          '/attendance': (context) => AttendanceDoctorScreen(),
          //admin
          '/homeadmin': (context) => AdminScreen(),
          '/adminnu': (context) => NewUserAdminScreen(),
          '/adminsett': (context) => SettingAdminScreen(),

          //TODO: hnzwd al screens f al application.
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          //TODO: hn3mel al theme bt3 al application hena.
          primaryColor: Color(0xFF06D6A0),
          canvasColor: Colors.black,
          //8yrt lon al appbar
        ));
  }
}
