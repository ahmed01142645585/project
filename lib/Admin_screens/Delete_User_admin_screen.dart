import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Login_screen.dart';

class DeleteUserAdminScreen extends StatefulWidget {
  @override
  _DeleteUserAdminScreenState createState() => _DeleteUserAdminScreenState();
}

class _DeleteUserAdminScreenState extends State<DeleteUserAdminScreen> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete User'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0.0,
      ),
      body: BackgroundImage(
        image: 'images/sora5a.jpeg',
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Text(
                'Enter User Information to Delete',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              TextFiledLogIn(
                hintText: 'Email',
                hideText: false,
                onChange: (value) {
                  email = value;
                },
              ),
              TextFiledLogIn(
                hintText: 'Password',
                hideText: true,
                onChange: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 50.0,
              ),
              ButtonLogIn(
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
