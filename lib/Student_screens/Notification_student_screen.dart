import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';

import '../Constins.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationStudentScreen extends StatefulWidget {
  @override
  _NotificationStudentScreenState createState() =>
      _NotificationStudentScreenState();
}

class _NotificationStudentScreenState extends State<NotificationStudentScreen> {
  String messageTitle = "Empty";
  String notificationAlert = "alert";

  //FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  @override
  void initState() {
    super.initState();
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification notification = message.notification;
    //   AndroidNotification android = message.notification?.android;
    //
    //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //     if (message.data['type'] == 'chat') {
    //       Navigator.pushNamed(context, '/notification',
    //           arguments: ChatArguments(message));
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: 'images/B1.jpeg',
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 6,
              color: Colors.transparent,
              child: Center(
                child: ColorizeAnimatedTextKit(
                  colors: [
                    kLoginColor,
                    kStudentColor,
                    kAdminColor,
                    kDoctorColor
                  ],
                  speed: Duration(milliseconds: 300),
                  repeatForever: true,
                  text: ['DGEST'],
                  textStyle: TextStyle(
                    fontFamily: 'ZenTokyoZoo',
                    fontSize: 80.0,
                    color: Color(0xFFecf8f8),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    Divider(
                      height: 10,
                      thickness: 3.0,
                      color: Colors.black45,
                    ),
                    // NotificationsStyle(
                    //   notfText: messageTitle,
                    //   timeAgo: '5 min ago',
                    // ),
                    // Divider(
                    //   height: 10,
                    //   thickness: 3.0,
                    //   color: Colors.black45,
                    // ),
                    NotificationsStyle(
                      notfText: 'New PDF is Uploaded in Image Processing!',
                      timeAgo: '12 Days ago',
                    ),
                    NotificationsStyle(
                      notfText: 'New Assignment Added in Compiler Theory!',
                      timeAgo: '12 Days ago',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsStyle extends StatelessWidget {
  NotificationsStyle({@required this.notfText, @required this.timeAgo});
  final String notfText;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(notfText,
                textAlign: TextAlign.center, style: kTextNoBackground),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              timeAgo,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Divider(
            height: 10,
            thickness: 3.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
