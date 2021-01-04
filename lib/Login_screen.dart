import 'package:flutter/material.dart';
import 'package:DGEST/Student_screens/Home_student_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        image: 'images/pexels-philippe-donn-1257860.jpg',
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'DGEST',
                    style: TextStyle(
                      fontFamily: 'PressStart2P',
                      fontSize: 70.0,
                      color: Colors.red[700],
                    ),
                  ),
                  Text(
                    'Welcome ツ',
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300]),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextFiledLogIn(
                    hintText: 'Username',
                    hideText: false,
                  ),
                  TextFiledLogIn(
                    hintText: 'Password',
                    hideText: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonLogIn(
                    buttonText: 'Sign In',
                    buttonPadding: EdgeInsets.symmetric(horizontal: 120.0),
                    onPress: () {
                      Navigator.pushNamed(context, '/first');
                    },
                  ),
                  Text(
                    'Forget Password ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    'Don\'t have an account ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  ButtonLogIn(
                    buttonText: 'Sign Up',
                    buttonPadding: EdgeInsets.symmetric(horizontal: 60.0),
                    onPress: () {
                      print('Sign Up Buttons is Pressed !');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFiledLogIn extends StatelessWidget {
  TextFiledLogIn({@required this.hintText, this.hideText});
  final String hintText;
  final bool hideText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      child: TextField(
        obscureText: hideText,
        style: TextStyle(color: Colors.black),
        onChanged: (value) {
          print(value);
          //TODO: hena lazem n3mel insert f al database al username w al password.
        },
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
      child: RaisedButton(
        color: Colors.grey[700],
        shape: StadiumBorder(),
        padding: buttonPadding,
        onPressed: onPress,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
