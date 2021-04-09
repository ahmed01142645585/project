import 'package:flutter/material.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
    // TODO: implement initState
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
      image: 'images/sora5a.jpeg',
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 6,
              color: Colors.transparent,
              child: Center(
                child: ColorizeAnimatedTextKit(
                  colors: [
                    Colors.green,
                    Colors.yellow,
                    Colors.red,
                  ],
                  speed: Duration(milliseconds: 300),
                  repeatForever: true,
                  text: ['DGEST'],
                  textStyle: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 70.0,
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
                    NotificationsStyle(
                      notfText: messageTitle,
                      timeAgo: '5 min ago',
                    ),
                    Divider(
                      height: 10,
                      thickness: 3.0,
                      color: Colors.black45,
                    ),
                    NotificationsStyle(
                      notfText: 'New assignment in Compiler is added',
                      timeAgo: '7 hours ago',
                    ),
                    Divider(
                      height: 10,
                      thickness: 3.0,
                      color: Colors.black45,
                    ),
                    NotificationsStyle(
                      notfText:
                          'The Mid-Term result for Computer Network is available now',
                      timeAgo: '2 days ago',
                    ),
                    Divider(
                      height: 10,
                      thickness: 3.0,
                      color: Colors.black45,
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
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 45.0,
            backgroundColor: Colors.white,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              children: [
                Text(
                  notfText,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  timeAgo,
                ),
              ],
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.menu,
                size: 35.0,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
