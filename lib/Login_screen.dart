import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Constins.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  String email;
  String password;
  bool spinner = false;
  String token = '';

  @override
  void initState() {
    getToken();
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            alert: true, badge: true, provisional: true, sound: true));

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        //_showItemDialog(message);
      },
      //onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        //_navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        //_navigateToItemDetail(message);
      },
    );
    super.initState();
  }

  void getToken() async {
    token = await firebaseMessaging.getToken();
  }

  void checkUserRoleFromFirebase() {
    getUser();
    _fireStore.collection('UserRoles').doc('${loggedInUSer.email}').get().then(
      (DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          //print('${documentSnapshot.data()['role']}');
          var fieldRoleData = documentSnapshot.data()['role'];
          if (fieldRoleData == 'student') {
            Navigator.pushNamed(context, '/home');
          } else if (fieldRoleData == 'doctor') {
            Navigator.pushNamed(context, '/homedoc');
          } else if (fieldRoleData == 'admin') {
            Navigator.pushNamed(context, '/homeadmin');
          } else {
            print('Error');
          }
        } else {
          print('Document does not exist on the database');
        }
      },
    );
  }

  void contactUsButton(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(
                child: Text(
                  "Contact Us",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              content: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Phone Number :-\n",
                      style: kSupportButtonHeadTitleTextStyle,
                    ),
                    TextSpan(
                      text: "01142645585\n",
                      style: kSupportButtonTitleTextStyle,
                    ),
                    TextSpan(
                      text: "Hot Line :-\n",
                      style: kSupportButtonHeadTitleTextStyle,
                    ),
                    TextSpan(
                      text: "16049\n",
                      style: kSupportButtonTitleTextStyle,
                    ),
                    TextSpan(
                      text: "Address :-\n",
                      style: kSupportButtonHeadTitleTextStyle,
                    ),
                    TextSpan(
                      text: "ring road katamiya - Cairo\n",
                      style: kSupportButtonTitleTextStyle,
                    ),
                    TextSpan(
                      text: "Facebook Page:-\n",
                      style: kSupportButtonHeadTitleTextStyle,
                    ),
                    TextSpan(
                      text: "modern academy official page\n",
                      style: kSupportButtonTitleTextStyle,
                    ),
                  ],
                ),
              ),
              backgroundColor: kLoginColor,
              actions: []);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: BackgroundImage(
          image: 'images/B3.jpeg',
          child: SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    ColorizeAnimatedTextKit(
                      colors: [
                        kLoginColor,
                        kStudentColor,
                        kAdminColor,
                        kDoctorColor
                      ],
                      repeatForever: true,
                      speed: Duration(milliseconds: 300),
                      text: ['DGEST'],
                      textStyle: TextStyle(
                        fontFamily: 'ZenTokyoZoo',
                        fontSize: 80.0,
                        color: Color(0xFFecf8f8),
                      ),
                    ),
                    FadeAnimatedTextKit(
                      repeatForever: true,
                      text: ['Welcome ツ'],
                      textStyle: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    TextFieldForDGEST(
                      hintText: 'Username',
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
                      height: 20.0,
                    ),
                    ButtonsForDGEST(
                      buttonColor: kLoginColor,
                      buttonText: 'Sign In',
                      buttonPadding: EdgeInsets.symmetric(horizontal: 100.0),
                      onPress: () async {
                        setState(() {
                          spinner = true;
                        });
                        try {
                          final oldUser =
                              await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                          if (oldUser != null) {
                            checkUserRoleFromFirebase();
                          }
                          setState(() {
                            spinner = false;
                          });
                        } on FirebaseAuthException catch (e) {
                          //print(e);
                          Alert(
                            context: context,
                            style: alertStyle,
                            title: "$e",
                          ).show();
                          setState(() {
                            spinner = false;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 110.0,
                    ),
                    Text(
                      'Don\'t have an account ?',
                      style: kNiceDayTextStyle,
                    ),
                    ButtonsForDGEST(
                      buttonColor: kLoginColor,
                      buttonText: 'Contact Us',
                      buttonPadding: EdgeInsets.symmetric(horizontal: 50.0),
                      onPress: () {
                        contactUsButton(context);
                      },
                    ),
                    // ButtonLogIn(
                    //     buttonText: 'TOKEN',
                    //     onPress: () {
                    //       print('$token');
                    //     }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
