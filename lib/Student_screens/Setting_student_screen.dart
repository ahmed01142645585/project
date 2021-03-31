import 'package:flutter/material.dart';
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _auth = FirebaseAuth.instance;
  bool spineer = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: spineer,
      child: BackgroundImage(
        image: 'images/sora5a.jpeg',
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.account_box,
                        size: 70,
                        color: Colors.black54,
                      ),
                      onPressed: () {}),
                  SizedBox(
                    width: 60.0,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          'ahmed tarek',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'ahmed.tarek@gmail.com',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Expanded(
                child: WidgetContainers(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'information',
                      style: kHSSMainButtonsTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: WidgetContainers(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'language',
                      style: kHSSMainButtonsTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: WidgetContainers(
                  onTap: () {
                    //TODO:ht3mel al zorar ale bytl3 al link.
                  },
                  child: Center(
                    child: Text(
                      'share app',
                      style: kHSSMainButtonsTextStyle,
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: WidgetContainers(
              //     onTap: () {},
              //     child: Center(
              //       child: Text(
              //         'help',
              //         style: kHSSMainButtonsTextStyle,
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: WidgetContainers(
                  onTap: () {
                    //TODO:ht3mel al zorar da ya tarek.
                  },
                  child: Center(
                    child: Text(
                      'support',
                      style: kHSSMainButtonsTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: WidgetContainers(
                  onTap: () {
                    setState(() {
                      spineer = true;
                    });
                    try {
                      _auth.signOut();
                      Navigator.pushNamed(context, '/login');
                      setState(() {
                        spineer = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Center(
                    child: Text(
                      'Sign out',
                      style: kHSSMainButtonsTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
