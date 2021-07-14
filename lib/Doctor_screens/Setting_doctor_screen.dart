import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:DGEST/Doctor_screens/Home_doctor_screen.dart';

class SettingDoctorScreen extends StatefulWidget {
  @override
  _SettingDoctorScreenState createState() => _SettingDoctorScreenState();
}

class _SettingDoctorScreenState extends State<SettingDoctorScreen> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  bool spineer = false;
  String imageUrl;
  final _picker = ImagePicker();
  String fieldPhotoURL;

  @override
  void initState() {
    super.initState();
    getUser();
    readPhoto();
  }

  void readPhoto() async {
    // by3mel read ll sora mn al url ale 3nd al student b3d m5lst al write kolha
    await _fireStore
        .collection('Doctors')
        .doc('${loggedInUSer.email}')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        fieldPhotoURL = documentSnapshot.data()['photo'];
      }
    });
    // by3mel al sora daymn tfdl mwgoda mhma 8yrt al screens
    setState(() {
      imageUrl = fieldPhotoURL;
    });
  }

  void takeAndUploadPhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    var file = File(pickedFile.path);
    //byrf3 al sora f al storage
    await _storage
        .ref()
        .child('ImagesProfile/${loggedInUSer.email}_photo')
        .putFile(file);
    //bygeb al url bt3 al sora ale f al storage
    String downloadURL = await FirebaseStorage.instance
        .ref('ImagesProfile/${loggedInUSer.email}_photo')
        .getDownloadURL();
    //by3mel update ll sora f al aplliccation
    //print(downloadURL);
    setState(() {
      imageUrl = downloadURL;
    });
    //byrf3 al url bt3 al sora f al student
    _fireStore
        .collection('Doctors')
        .doc('${loggedInUSer.email}')
        .update({'photo': downloadURL});
  }
  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.getImage(
  //     source: source,
  //   );
  //   var file = File(pickedFile.path);
  //   final _storage = FirebaseStorage.instance;
  //   await _storage.ref().child('folderName/imageName').putFile(file);
  //   String downloadURL = await FirebaseStorage.instance
  //       .ref('folderName/imageName')
  //       .getDownloadURL();
  //   print(downloadURL);
  //   setState(() {
  //     imageUrl = downloadURL;
  //   });
  // }

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
            backgroundColor: kDoctorColor,
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Clipboard.setData(new ClipboardData(
                      text: "https://console.firebase.google.com/"));
                  Navigator.pop(context, true);
                },
                child: Text(
                  "COPY",
                  style:
                      TextStyle(color: kTextStyleColor, fontFamily: 'Lobster'),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  "CANCEL",
                  style:
                      TextStyle(color: kTextStyleColor, fontFamily: 'Lobster'),
                ),
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
              backgroundColor: kDoctorColor,
              actions: []);
        });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: spineer,
      child: BackgroundImage(
        image: 'images/B4.jpeg',
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imageProfile(),
                    Expanded(
                      child: Column(
                        children: [
                          //GetUserName('${loggedInUSer.email}'),
                          GetDoctorUsernameFromFirebase(
                              '${loggedInUSer.email}'),
                          Text(
                            '${loggedInUSer.email}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200.0,
              ),
              // Expanded(
              //   child: WidgetContainers(
              //     widgetColor: kDoctorColor,
              //     onTap: () {},
              //     child: Center(
              //       child: Text(
              //         'Languages',
              //         style: kTextStyle,
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: WidgetContainers(
                  widgetColor: kDoctorColor,
                  onTap: () {
                    shareAppButton(context);
                  },
                  child: Center(
                    child: Text(
                      'Share App',
                      style: kTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: WidgetContainers(
                  widgetColor: kDoctorColor,
                  onTap: () {
                    support(context);
                  },
                  child: Center(
                    child: Text(
                      'Support',
                      style: kTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: WidgetContainers(
                  widgetColor: kDoctorColor,
                  onTap: () {
                    setState(() {
                      spineer = true;
                    });
                    try {
                      _auth.signOut();
                      Navigator.pushNamed(context, '/');
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
                      style: kTextStyle,
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
                                    //takePhoto(ImageSource.camera);
                                    takeAndUploadPhoto(ImageSource.camera);
                                    Navigator.pop(context, true);
                                  },
                                  label: Text(
                                    "Camera",
                                    style: TextStyle(color: kDoctorColor),
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
                                    //takePhoto(ImageSource.gallery);
                                    takeAndUploadPhoto(ImageSource.gallery);
                                    Navigator.pop(context, true);
                                  },
                                  label: Text(
                                    "Gallery",
                                    style: TextStyle(color: kDoctorColor),
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
                color: kDoctorColor,
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
