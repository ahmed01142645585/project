import 'package:flutter/material.dart';
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Student_screens/Student_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomeStudentScreen extends StatefulWidget {
  @override
  _HomeStudentScreenState createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
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
                  imageProfile(),
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
              flex: 3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  //TODO: al mfrod hena de tsht8l firebase w backend 3shan t3mel al widget de. (Feh t2rebn for loop f 7ta de).
                  WidgetContainers(
                    onTap: () {
                      Navigator.pushNamed(context, '/subject');
                    },
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
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: _imageFile == null
                ? AssetImage("images/sora5a.jpeg")
                : FileImage(File(_imageFile.path)),
          ),
          Positioned(
            bottom: 1,
            right: 1,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
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

  Widget bottomSheet() {
    return Container(
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
    );
  }
}
