import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple[100],
        body: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Text(
              'DGEST',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.blue,
              ),
            ),
            Text(
              'Welcome!',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ButtonLogIn.loginScreenButtons(
              buttonText: 'Log In',
              buttonPadding: EdgeInsets.symmetric(horizontal: 120.0),
            ),
            Text('Forget Password ?'),
            Text('Don\'t have an account ?'),
            ButtonLogIn.loginScreenButtons(
              buttonText: 'Sign Up',
              buttonPadding: EdgeInsets.symmetric(horizontal: 70.0),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonLogIn extends StatelessWidget {
  final String buttonText;
  final EdgeInsetsGeometry buttonPadding;

  ButtonLogIn.loginScreenButtons({this.buttonText, this.buttonPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.purple[800],
        shape: StadiumBorder(),
        padding: buttonPadding,
        onPressed: () {},
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

/*
void onClick(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Center(child: Text("DEGST")),
            content: Text("login is OK"),
            backgroundColor: Colors.white,
            actions: [
              RaisedButton(
                color: Colors.grey,
                onPressed: () {},
                child: Text("OK"),
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {},
                child: Text("CANCEL"),
              ),
            ]);
      });
}
CircleAvatar(
                radius: 90.0,
                backgroundImage: AssetImage('images/logo_transparent.png'),
                backgroundColor: Colors.purple[100],
              ),
*/
