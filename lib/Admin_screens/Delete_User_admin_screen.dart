import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Constins.dart';

class DeleteUserAdminScreen extends StatefulWidget {
  @override
  _DeleteUserAdminScreenState createState() => _DeleteUserAdminScreenState();
}

class _DeleteUserAdminScreenState extends State<DeleteUserAdminScreen> {
  final _fireStore = FirebaseFirestore.instance;
  // final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAdminColor,
        centerTitle: true,
        title: Text(
          'Delete User',
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
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Text('Enter User Information to Delete',
                  style: kTextNoBackground),
              SizedBox(
                height: 15.0,
              ),
              TextFieldForDGEST(
                hintText: 'Email',
                hideText: false,
                onChange: (value) {
                  email = value;
                },
              ),
              TextFieldForDGEST(
                hintText: 'Password',
                hideText: true,
                onChange: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              ButtonsForDGEST(
                  buttonColor: kAdminColor,
                  buttonText: 'Delete User',
                  onPress: () async {
                    _fireStore.collection('Students').doc('$email').delete();
                    _fireStore.collection('Doctors').doc('$email').delete();
                    _fireStore.collection('UserRoles').doc('$email').delete();
                    await AuthService().deleteUser(email, password);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future deleteUser(String theEmail, String thePassword) async {
    try {
      //final user = _auth.currentUser;
      AuthCredential credentials =
          EmailAuthProvider.credential(email: theEmail, password: thePassword);
      //print(user);
      await _auth.currentUser.reauthenticateWithCredential(credentials);
      //print(user);
      await _auth.currentUser.delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
