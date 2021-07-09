import 'package:DGEST/Student_screens/Subject_student-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';

class HomeStudentScreen extends StatefulWidget {
  @override
  _HomeStudentScreenState createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  final _fireStore = FirebaseFirestore.instance;
  String imageUrl;
  String fieldPhotoURL;

  @override
  void initState() {
    super.initState();
    getUser();
    readPhoto();
  }

  //TODO:hn8yr mkan de 3shan m3mola f 2 screens bzbt.
  void checkUserRoleFromFirebase(String courseID) {
    _fireStore
        .collection('UserRoles')
        .doc('${loggedInUSer.email}')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        //print('${documentSnapshot.data()['role']}');
        var fieldRoleData = documentSnapshot.data()['role'];
        if (fieldRoleData == 'student') {
          //Navigator.pushNamed(context, '/subject');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubjectStudentScreen(
                courseID: courseID,
              ),
            ),
          );
        } else if (fieldRoleData == 'doctor') {
          Navigator.pushNamed(context, '/subjectdoc');
        } else {
          print('Error');
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void readPhoto() async {
    await _fireStore
        .collection('Students')
        .doc('${loggedInUSer.email}')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        fieldPhotoURL = documentSnapshot.data()['photo'];
      }
    });
    setState(() {
      imageUrl = fieldPhotoURL;
    });
  }

  // void getID(String documentId) async {
  //   send = _fireStore
  //       .collection('Students')
  //       .doc(documentId)
  //       .collection('Courses')
  //       .get()
  //       .then((QuerySnapshot snapshot) => {
  //             snapshot.docs.forEach((element) {
  //               element.reference.id;
  //             })
  //           });
  // }

  Widget getStudentCoursesFromFirebase(String documentId) {
    return FutureBuilder(
      future: _fireStore
          .collection('Students')
          .doc(documentId)
          .collection('Courses')
          .get(),
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
              widgetColor: kStudentColor,
              width: 250,
              onTap: () async {
                checkUserRoleFromFirebase(fieldDataArray.elementAt(1));
              },
              child: ListDesign(
                drText: '${fieldDataArray.elementAt(0)}',
                courseText: '${fieldDataArray.elementAt(1)}',
                yearSemster: 'Level ${fieldDataArray.elementAt(2).toString()}',
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
          widgetColor: kStudentColor,
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

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: 'images/B1.jpeg',
      child: SafeArea(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 65.0,
                    width: 65.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      image: DecorationImage(
                        image: imageUrl != null
                            ? NetworkImage(imageUrl)
                            : AssetImage("images/default_profile.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    children: [
                      GetStudentUsernameFromFirebase('${loggedInUSer.email}'),
                      //getUsernameFromFirebase('${loggedInUSer.email}'),
                      Text(
                        'Have a nice day !',
                        style: kNiceDayTextStyle,
                      )
                    ],
                  ),
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.search,
                  //     size: 45.0,
                  //     color: Colors.black54,
                  //   ),
                  //   onPressed: () {
                  //     print('search icon is pressed!');
                  //   },
                  // ),
                ],
              ),
            ),
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
            Expanded(
              flex: 3,
              child: getStudentCoursesFromFirebase('${loggedInUSer.email}'),
            ), //StudentCourses('${loggedInUSer.email}')),
          ],
        ),
      ),
    );
  }
}

class GetStudentUsernameFromFirebase extends StatelessWidget {
  GetStudentUsernameFromFirebase(this.documentId);
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

// class StudentCourses extends StatelessWidget {
//   StudentCourses(this.documentId);
//   final String documentId;
//   final _fireStore = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: _fireStore
//           .collection('Students')
//           .doc(documentId)
//           .collection('Courses')
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }
//         if (snapshot.hasData) {
//           final documents = snapshot.data.docs;
//           List<WidgetContainers> courseWidgets = [];
//           for (var field in documents) {
//             List fieldDataArray = field.get('subject');
//
//             final courseWidget = WidgetContainers(
//               width: 250,
//               onTap: () {
//                 Navigator.pushNamed(context, '/subject');
//               },
//               child: ListDesign(
//                 drText: '${fieldDataArray.elementAt(0)}',
//                 courseText: '${fieldDataArray.elementAt(1)}',
//                 yearSemster: '${fieldDataArray.elementAt(2)}',
//               ),
//             );
//             courseWidgets.add(courseWidget);
//           }
//           return ListView(
//             scrollDirection: Axis.horizontal,
//             children: courseWidgets,
//           );
//         }
//         return WidgetContainers(
//           width: 250,
//           onTap: () {},
//           child: ListDesign(
//             drText: 'LOADING',
//             courseText: 'LOADING',
//             yearSemster: 'LOADING',
//           ),
//         );
//       },
//     );
//   }
// }
