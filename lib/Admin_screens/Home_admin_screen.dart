import 'package:flutter/material.dart';
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeAdminScreen extends StatefulWidget {
  @override
  _HomeAdminScreenState createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  final _fireStore = FirebaseFirestore.instance;
  String imageUrl;
  String fieldPhotoURL;

  @override
  void initState() {
    super.initState();
    getUser();
    readPhoto();
  }

  void readPhoto() async {
    await _fireStore
        .collection('Admins')
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

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: 'images/B2.jpeg',
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
                      GetAdminUsernameFromFirebase('${loggedInUSer.email}'),
                      Text('Have a nice day !', style: kNiceDayTextStyle)
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
            Expanded(
              child: WidgetContainers(
                widgetColor: kAdminColor,
                width: 200,
                onTap: () {
                  Navigator.pushNamed(context, '/adminnu');
                },
                child: Center(
                  child: Text(
                    'Add New User',
                    style: kTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              child: WidgetContainers(
                widgetColor: kAdminColor,
                width: 200,
                onTap: () {
                  Navigator.pushNamed(context, '/addcourse');
                },
                child: Center(
                  child: Text(
                    'Add New Course',
                    style: kTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              child: WidgetContainers(
                widgetColor: kAdminColor,
                width: 200,
                onTap: () {
                  // Navigator.pushNamed(context, '/adminnu');
                },
                child: Center(
                  child: Text(
                    'Edit User',
                    style: kTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              child: WidgetContainers(
                widgetColor: kAdminColor,
                width: 200,
                onTap: () {
                  Navigator.pushNamed(context, '/deleteadmin');
                },
                child: Center(
                  child: Text(
                    'Delete User',
                    style: kTextStyle,
                  ),
                ),
              ),
            ),
            // Expanded(
            //   flex: 3,
            //   child: getStudentCoursesFromFirebase('${loggedInUSer.email}'),
            // ), //StudentCourses('${loggedInUSer.email}')),
          ],
        ),
      ),
    );
  }
}

class GetAdminUsernameFromFirebase extends StatelessWidget {
  GetAdminUsernameFromFirebase(this.documentId);
  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Admins');

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
