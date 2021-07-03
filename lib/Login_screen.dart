import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:flutter/services.dart';
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

  // var alertStyle = AlertStyle(
  //   backgroundColor: Color(0xFF06D6A0),
  //   animationType: AnimationType.grow,
  //   isCloseButton: true,
  //   //isOverlayTapDismiss: false,
  //   descTextAlign: TextAlign.start,
  //   isButtonVisible: false,
  //   alertAlignment: Alignment.center,
  //   animationDuration: Duration(milliseconds: 200),
  //   // alertBorder: RoundedRectangleBorder(
  //   //   borderRadius: BorderRadius.circular(50.0),
  //   // ),
  //   titleStyle: TextStyle(
  //     color: Colors.black,
  //   ),
  // );

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
                      style: supportButtonHeadTitleTextStyle,
                    ),
                    TextSpan(
                      text: "01142645585\n",
                      style: supportButtonTitleTextStyle,
                    ),
                    TextSpan(
                      text: "Hot Line :-\n",
                      style: supportButtonHeadTitleTextStyle,
                    ),
                    TextSpan(
                      text: "16049\n",
                      style: supportButtonTitleTextStyle,
                    ),
                    TextSpan(
                      text: "Address :-\n",
                      style: supportButtonHeadTitleTextStyle,
                    ),
                    TextSpan(
                      text: "ring road katamiya - Cairo\n",
                      style: supportButtonTitleTextStyle,
                    ),
                    TextSpan(
                      text: "Facebook Page:-\n",
                      style: supportButtonHeadTitleTextStyle,
                    ),
                    TextSpan(
                      text: "modern academy official page\n",
                      style: supportButtonTitleTextStyle,
                    ),
                  ],
                ),
              ),
              backgroundColor: Color(0xFF06D6A0),
              actions: []);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: BackgroundImage(
          image: 'images/sora5.jpeg',
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
                        Colors.green,
                        Colors.yellow,
                        Colors.red,
                      ],
                      repeatForever: true,
                      speed: Duration(milliseconds: 300),
                      text: ['DGEST'],
                      textStyle: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 60.0,
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
                    TextFiledLogIn(
                      hintText: 'Username',
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
                      height: 20.0,
                    ),
                    ButtonLogIn(
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
                      height: 140.0,
                    ),
                    Text(
                      'Don\'t have an account ?',
                      style: TextStyle(color: Colors.white),
                    ),
                    ButtonLogIn(
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

class TextFiledLogIn extends StatelessWidget {
  TextFiledLogIn(
      {@required this.hintText,
      this.hideText,
      this.onChange,
      this.inputFormat});
  final String hintText;
  final bool hideText;
  final Function onChange;
  final List inputFormat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      child: TextField(
        obscureText: hideText,
        inputFormatters: inputFormat,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black),
        onChanged: onChange,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

class ButtonLogIn extends StatelessWidget {
  ButtonLogIn(
      {@required this.buttonText, this.buttonPadding, @required this.onPress});
  final String buttonText;
  final EdgeInsetsGeometry buttonPadding;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFF06D6A0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
            padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(buttonPadding)),
        onPressed: onPress,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
      ),
    );
  }
}
