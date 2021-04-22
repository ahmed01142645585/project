import 'package:flutter/material.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeStudentScreen extends StatefulWidget {
  @override
  _HomeStudentScreenState createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUSer;

  @override
  void initState() {
    // TODO: implement initState
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

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: 'images/sora5a.jpeg',
      child: SafeArea(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images/default_profile.jpg"),
                  ),
                  Column(
                    children: [
                      GetUserName('${loggedInUSer.email}'),
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
                      size: 45.0,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      print('search icon is pressed!');
                    },
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: WidgetContainers(
            //     width: 200,
            //     onTap: () {},
            //     child: Center(
            //       child: Text(
            //         'Attendance',
            //         style: kHSSMainButtonsTextStyle,
            //       ),
            //     ),
            //   ),
            // ),
            // Expanded(
            //   child: WidgetContainers(
            //     width: 200,
            //     onTap: () {},
            //     child: Center(
            //       child: Text(
            //         'Tasks',
            //         style: kHSSMainButtonsTextStyle,
            //       ),
            //     ),
            //   ),
            // ),
            // Expanded(
            //   child: WidgetContainers(
            //     width: 200,
            //     onTap: () {
            //       Navigator.pushNamed(context, '/note');
            //     },
            //     child: Center(
            //       child: Text(
            //         'Notes',
            //         style: kHSSMainButtonsTextStyle,
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(flex: 3, child: StudentCourses('${loggedInUSer.email}')),
          ],
        ),
      ),
    );
  }

  // Widget getUserName() {
  //   CollectionReference users =
  //       FirebaseFirestore.instance.collection('Students');
  //
  //   return FutureBuilder<DocumentSnapshot>(
  //     future: users.doc('${loggedInUSer.email}').get(),
  //     builder:
  //         (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //       if (snapshot.hasError) {
  //         return Text("Something went wrong");
  //       }
  //
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         Map<String, dynamic> data = snapshot.data.data();
  //         return Text(
  //           "Hello, ${data['name']}",
  //           style: TextStyle(
  //             fontSize: 25,
  //           ),
  //         );
  //       }
  //
  //       return Text(
  //         "loading",
  //         style: TextStyle(
  //           fontSize: 25,
  //         ),
  //       );
  //     },
  //   );
  // }
}

class GetUserName extends StatelessWidget {
  GetUserName(this.documentId);
  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Students');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text(
            '${data['name']}',
            style: TextStyle(
              fontSize: 25,
            ),
          );
        }

        return Text(
          'loading',
          style: TextStyle(
            fontSize: 25,
          ),
        );
      },
    );
  }
}

class StudentCourses extends StatelessWidget {
  StudentCourses(this.documentId);
  final String documentId;
  final _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _fireStore
          .collection('Students')
          .doc(documentId)
          .collection('Courses')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.hasData) {
          final documents = snapshot.data.docs;
          List<WidgetContainers> courseWidgets = [];
          for (var field in documents) {
            List fieldDataArray = field.get('subject');

            final courseWidget = WidgetContainers(
              width: 250,
              onTap: () {
                Navigator.pushNamed(context, '/subject');
              },
              child: ListDesign(
                drText: '${fieldDataArray.elementAt(0)}',
                courseText: '${fieldDataArray.elementAt(1)}',
                yearSemster: '${fieldDataArray.elementAt(2)}',
              ),
            );
            courseWidgets.add(courseWidget);
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            children: courseWidgets,
          );
        }
        return WidgetContainers(
          width: 250,
          onTap: () {},
          child: ListDesign(
            drText: 'LOADING',
            courseText: 'LOADING',
            yearSemster: 'LOADING',
          ),
        );
      },
    );
  }
}
