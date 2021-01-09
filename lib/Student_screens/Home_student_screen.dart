import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Constins.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeStudentScreen extends StatefulWidget {
  // static const String id = '';
  @override
  _HomeStudentScreenState createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  int selectedIndex = 0;
  //TODO: al mfrod b3d ma nshof 7l al bottombar n5le de tege mn al screen al adema w tsm3 f al gdeda.
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUSer;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUSer = user;
        print(loggedInUSer.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        image: 'images/sora5a.jpeg',
        child: SafeArea(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    Column(
                      children: [
                        Text(
                          'Hello,Gehad!',
                          style: TextStyle(
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Have a nice day !',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 37,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          print('search icon is pressed!');
                        }),
                  ],
                ),
              ),
              Expanded(
                child: WidgetContainers(
                  width: 200,
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'Attendance',
                      style: kHSSMainButtonsTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: WidgetContainers(
                  width: 200,
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'Tasks',
                      style: kHSSMainButtonsTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: WidgetContainers(
                  width: 200,
                  onTap: () {
                    Navigator.pushNamed(context, '/note');
                  },
                  child: Center(
                    child: Text(
                      'Notes',
                      style: kHSSMainButtonsTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //TODO: al mfrod hena de tsht8l firebase w backend 3shan t3mel al widget de. (Feh t2rebn for loop f 7ta de).
                    WidgetContainers(
                      onTap: () {},
                      width: 220,
                      child: ListDesign(
                        drText: 'Lamiaa Hassan',
                        courseText: 'Compiler',
                        yearSemster: 'Forth Year,\nFirst semster.',
                      ),
                    ),
                    WidgetContainers(
                      onTap: () {},
                      width: 220,
                      child: ListDesign(
                        drText: 'Abo El-ela',
                        courseText: 'Expert System',
                        yearSemster: 'Forth Year,\nFirst semster.',
                      ),
                    ),
                    WidgetContainers(
                      onTap: () {},
                      width: 220,
                      child: ListDesign(
                        drText: 'Abbas Rostm',
                        courseText: 'Image Prossesing',
                        yearSemster: 'Forth Year,\nFirst semster.',
                      ),
                    ),
                    WidgetContainers(
                      onTap: () {},
                      width: 220,
                      child: ListDesign(
                        drText: 'Sherif Mohram',
                        courseText: 'Computer Network',
                        yearSemster: 'Forth Year,\nFirst semster.',
                      ),
                    ),
                    WidgetContainers(
                      onTap: () {},
                      width: 220,
                      child: ListDesign(
                        drText: 'AbdelFatah',
                        courseText: 'Modeling & Simulation',
                        yearSemster: 'Forth Year,\nFirst semster.',
                      ),
                    ),
                    WidgetContainers(
                      onTap: () {},
                      width: 220,
                      child: ListDesign(
                        drText: 'Lamiaa Hassan',
                        courseText: 'Compiler',
                        yearSemster: 'Forth Year,\nFirst semster.',
                      ),
                    ),
                  ],
                ),
              ),
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                selectedItemColor: Color(0xFF06D6A0),
                unselectedItemColor: Colors.white,
                iconSize: 30.0,
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                    // if (index == 1) {
                    //   Navigator.pushNamed(context, '/note');
                    // } else if (index == 2) {}
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.assignment),
                    title: Text('Tasks'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    title: Text('Notifications'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListDesign extends StatelessWidget {
  ListDesign(
      {@required this.drText,
      @required this.courseText,
      @required this.yearSemster});
  final String drText;
  final String courseText;
  final String yearSemster;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Text(
              drText,
              style: kHSSMainListTextStyle,
            )
          ],
        ),
        Text(
          courseText,
          style: kHSSMainListTextStyle,
        ),
        Text(
          yearSemster,
          style: kHSSMainListTextStyle,
        )
      ],
    );
  }
}

//TODO: lazem nshof trea2a nzbt feha al classes ale bst3melha f aktr mn screen w a5le feh fr2 ben al frontend w al backend.
class WidgetContainers extends StatelessWidget {
  WidgetContainers({this.width, this.onTap, this.child});
  final double width;
  final Function onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(13.0),
        width: width,
        decoration: BoxDecoration(
          color: Color(0xFF06D6A0),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}

//TODO: n8yr mkan al class da 3shan hns3mlo fkol 7ata b3den.
class BackgroundImage extends StatelessWidget {
  BackgroundImage({@required this.image, @required this.child});
  final String image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
