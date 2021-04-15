import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';
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
  String email;
  String password;
  bool spinner = false;

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
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "01142645585\n",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextSpan(
                      text: "Hot Line :-\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "16049\n",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextSpan(
                      text: "Address :-\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "ring road katamiya - Cairo\n",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextSpan(
                      text: "Facebook Page:-\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "modern academy official page\n",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              // Text("phone number :-"
              //     "\n01142645585"
              //     "\nhot line :-"
              //     "\n16049"
              //     "\naddress :-"
              //     "\nring road katamiya-cairo"
              //     "\nfacebook page:-"
              //     "\nmodern academy official page"),
              // contentTextStyle: TextStyle(
              //   fontSize: 20,
              // ),
              backgroundColor: Color(0xFF06D6A0),
              actions: []);
        });
  }
  //TODO:ht3mel hena ya tarek al zorar bt3 contact us ale hytl3 ll user al m3lomat 3n al gm3a.

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
                            Navigator.pushNamed(context, '/home');
                          }
                          setState(() {
                            spinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                    // Text(
                    //   'Forget Password ?',
                    //   style: TextStyle(color: Colors.white),
                    // ),
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
                        //TODO: htndh al function hena ya tarek.
                      },
                    ),
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
  TextFiledLogIn({@required this.hintText, this.hideText, this.onChange});
  final String hintText;
  final bool hideText;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      child: TextField(
        obscureText: hideText,
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
