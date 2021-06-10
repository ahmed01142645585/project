import 'package:flutter/material.dart';
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeAdminScreen extends StatefulWidget {
  @override
  _HomeAdminScreenState createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  @override
  void initState() {
    super.initState();
    getUser();
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
                      GetAdminUsernameFromFirebase('${loggedInUSer.email}'),
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
            Expanded(
              child: WidgetContainers(
                width: 200,
                onTap: () {
                  Navigator.pushNamed(context, '/adminnu');
                },
                child: Center(
                  child: Text(
                    'Add New User',
                    style: kHSSMainButtonsTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              child: WidgetContainers(
                width: 200,
                onTap: () {
                  Navigator.pushNamed(context, '/deleteadmin');
                },
                child: Center(
                  child: Text(
                    'Delete User',
                    style: kHSSMainButtonsTextStyle,
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
