import 'package:flutter/material.dart';
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Subject_doctor_screen.dart';

class HomeDoctorScreen extends StatefulWidget {
  @override
  _HomeDoctorScreenState createState() => _HomeDoctorScreenState();
}

class _HomeDoctorScreenState extends State<HomeDoctorScreen> {
  final _fireStore = FirebaseFirestore.instance;
  String fieldPhotoURL;
  String imageUrl;

  @override
  void initState() {
    super.initState();
    getUser();
  }

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
          Navigator.pushNamed(context, '/subject');
        } else if (fieldRoleData == 'doctor') {
          //Navigator.pushNamed(context, '/subjectdoc');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubjectDoctorScreen(
                courseID: courseID,
              ),
            ),
          );
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

  Widget getStudentCoursesFromFirebase(String documentId) {
    return StreamBuilder(
      stream: _fireStore
          .collection('Doctors')
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
                //Navigator.pushNamed(context, '/subject');
                checkUserRoleFromFirebase(fieldDataArray.elementAt(0));
              },
              child: ListDesign(
                drText: '',
                courseText: '${fieldDataArray.elementAt(0)}',
                yearSemster: '${fieldDataArray.elementAt(1)}',
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
            drText: '',
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
                  Column(
                    children: [
                      GetDoctorUsernameFromFirebase('${loggedInUSer.email}'),
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

class GetDoctorUsernameFromFirebase extends StatelessWidget {
  GetDoctorUsernameFromFirebase(this.documentId);
  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Doctors');

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
