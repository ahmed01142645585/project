//TODO: hn3mel hena screen al settings w hnndha f student screen 3shan de mwgoda f al bar ale t7t.
import 'package:flutter/material.dart';
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
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
                onTap: () {},
                child: Center(
                  child: Text(
                    'share app',
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
                    'help',
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
                    'support',
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
                    'sign out',
                    style: kHSSMainButtonsTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
