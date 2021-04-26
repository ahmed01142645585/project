import 'package:DGEST/Student_screens/Student_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Student_screens/Home_student_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class SettingDoctorScreen extends StatefulWidget {
  @override
  _SettingDoctorScreenState createState() => _SettingDoctorScreenState();
}

class _SettingDoctorScreenState extends State<SettingDoctorScreen> {
  final _auth = FirebaseAuth.instance;
  bool spineer = false;
  User loggedInUSer;
  String imageUrl;
  final _picker = ImagePicker();
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

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    var file = File(pickedFile.path);
    final _storage = FirebaseStorage.instance;
    await _storage.ref().child('folderName/imageName').putFile(file);
    String downloadURL = await FirebaseStorage.instance
        .ref('folderName/imageName')
        .getDownloadURL();
    print(downloadURL);
    setState(() {
      imageUrl = downloadURL;
    });
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
            content: Text("https://console.firebase.google.com/"),
            contentTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            backgroundColor: Color(0xFF06D6A0),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  Clipboard.setData(new ClipboardData(
                      text: "https://console.firebase.google.com/"));
                  Navigator.pop(context, true);
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
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    imageProfile(),
                    SizedBox(
                      width: 10.0,
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
                  },
                  child: Center(
                    child: Text(
                      'Share App',
                      style: kHSSMainButtonsTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: WidgetContainers(
                  onTap: () {
                    support(context);
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

  Widget imageProfile() {
    return Center(
      child: Stack(
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
          Positioned(
            bottom: 1,
            right: 1,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Choose Profile Photo",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton.icon(
                                  icon: Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    takePhoto(ImageSource.camera);
                                    Navigator.pop(context, true);
                                  },
                                  label: Text(
                                    "Camera",
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                ),
                                SizedBox(
                                  width: 50.0,
                                ),
                                TextButton.icon(
                                  icon: Icon(
                                    Icons.image,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    takePhoto(ImageSource.gallery);
                                    Navigator.pop(context, true);
                                  },
                                  label: Text(
                                    "Gallery",
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Widget bottomSheet() {
  //   return Container(
  //     height: 100,
  //     width: MediaQuery.of(context).size.width,
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 20,
  //     ),
  //     child: Column(
  //       children: [
  //         Text(
  //           "Choose Profile Photo",
  //           style: TextStyle(
  //             fontSize: 20,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             TextButton.icon(
  //               icon: Icon(
  //                 Icons.camera,
  //                 color: Colors.white,
  //               ),
  //               onPressed: () {
  //                 takePhoto(ImageSource.camera);
  //                 Navigator.pop(context, true);
  //               },
  //               label: Text(
  //                 "Camera",
  //                 style: TextStyle(color: Colors.teal),
  //               ),
  //             ),
  //             SizedBox(
  //               width: 50.0,
  //             ),
  //             TextButton.icon(
  //               icon: Icon(
  //                 Icons.image,
  //                 color: Colors.white,
  //               ),
  //               onPressed: () {
  //                 takePhoto(ImageSource.gallery);
  //                 Navigator.pop(context, true);
  //               },
  //               label: Text(
  //                 "Gallery",
  //                 style: TextStyle(color: Colors.teal),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
