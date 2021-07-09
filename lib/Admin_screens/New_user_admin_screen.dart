import 'package:DGEST/Admin_screens/add_doctor_admin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Constins.dart';
import 'add_student_admin_screen.dart';

class NewUserAdminScreen extends StatefulWidget {
  @override
  _NewUserAdminScreenState createState() => _NewUserAdminScreenState();
}

class _NewUserAdminScreenState extends State<NewUserAdminScreen> {
  String theEmail;
  String thePassword;
  String newValue = 'student';
  final _fireStore = FirebaseFirestore.instance;

  static Future<UserCredential> register(String email, String password) async {
    UserCredential userCredential;
    FirebaseApp app = await Firebase.initializeApp(
        name: 'Secondary', options: Firebase.app().options);
    try {
      userCredential = await FirebaseAuth.instanceFor(app: app)
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print('$e');
    }

    await app.delete();
    return Future.sync(() => userCredential);
  }

  void registerNewUserAndAddData() {
    try {
      final newUser = register(theEmail, thePassword);
      if (newUser != null) {
        _fireStore
            .collection('UserRoles')
            .doc('$theEmail')
            .set({'role': '$newValue'});
      }
      final messageBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 50.0, left: 20.0, right: 20.0),
        backgroundColor: kAdminColor,
        content: Text(
          'User Added Successfully',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(messageBar);
      if (newValue == 'student') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddNewStudentAdminScreen(
              studentEmail: theEmail,
            ),
          ),
        );
      } else if (newValue == 'doctor') {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AddNewDoctorAdminScreen(doctorEmail: theEmail)),
        );
      } else {
        print('Error.');
      }
    } on FirebaseAuthException catch (e) {
      Alert(
        context: context,
        style: alertStyle,
        title: "$e",
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kAdminColor,
        title: Text(
          'Add New User',
          style: kAppBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0.0,
      ),
      body: BackgroundImage(
        image: 'images/B2.jpeg',
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text('Enter New User Information', style: kTextNoBackground),
                  TextFieldForDGEST(
                    hintText: 'Email',
                    hideText: false,
                    onChange: (value) {
                      theEmail = value;
                    },
                  ),
                  TextFieldForDGEST(
                    hintText: 'Password',
                    hideText: true,
                    onChange: (value) {
                      thePassword = value;
                    },
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'Select New User Role',
                    style: kTextNoBackground,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: DropdownButton(
                      style: TextStyle(fontSize: 25.0),
                      dropdownColor: kAdminColor,
                      icon: Icon(Icons.arrow_drop_down_circle),
                      isExpanded: true,
                      iconSize: 25.0,
                      value: newValue,
                      items: [
                        DropdownMenuItem(
                          child: Text('student'),
                          value: 'student',
                        ),
                        DropdownMenuItem(
                          child: Text('doctor'),
                          value: 'doctor',
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          newValue = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  ButtonsForDGEST(
                    buttonColor: kAdminColor,
                    buttonText: 'Add User',
                    buttonPadding: EdgeInsets.symmetric(horizontal: 100.0),
                    onPress: () {
                      registerNewUserAndAddData();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
