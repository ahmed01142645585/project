import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:DGEST/Student_screens/Home_student_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _auth = FirebaseAuth.instance;
  bool spineer = false;
  User loggedInUSer;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUSer = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void shareAppButton(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Share App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            content: Text("https://stackoverflow.com/"),
            contentTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            backgroundColor: Color(0xFF06D6A0),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  Clipboard.setData(
                      new ClipboardData(text: "https://stackoverflow.com/"));
                },
                child: Text("copy"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () => Navigator.pop(context, true),
                child: Text("CANCEL"),
              ),
            ],
          );
        });
  }

  void support(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(
                child: Text(
                  "Support",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              content: RichText(
                text: TextSpan(
                  children: <TextSpan>[
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
              backgroundColor: Color(0xFF06D6A0),
              actions: []);
        });
  }

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
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/default_profile.jpg'),
                      radius: 35.0,
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Column(
                      children: [
                        GetUserName('${loggedInUSer.email}'),
                        Text(
                          '${loggedInUSer.email}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              // Expanded(
              //   child: WidgetContainers(
              //     onTap: () {},
              //     child: Center(
              //       child: Text(
              //         'information',
              //         style: kHSSMainButtonsTextStyle,
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: WidgetContainers(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'Languages',
                      style: kHSSMainButtonsTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: WidgetContainers(
                  onTap: () {
                    shareAppButton(context);
                    //TODO:ht3mel al zorar ale bytl3 al link.
                  },
                  child: Center(
                    child: Text(
                      'Share App',
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
                    support(context);
                    //TODO:ht3mel al zorar da ya tarek.
                  },
                  child: Center(
                    child: Text(
                      'Support',
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
