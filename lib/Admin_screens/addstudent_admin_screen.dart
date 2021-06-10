import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Login_screen.dart';
import 'package:flutter/services.dart';

class AddNewStudentAdminScreen extends StatefulWidget {
  final String studentEmail;
  AddNewStudentAdminScreen({@required this.studentEmail});
  @override
  _AddNewStudentAdminScreenState createState() =>
      _AddNewStudentAdminScreenState();
}

class _AddNewStudentAdminScreenState extends State<AddNewStudentAdminScreen> {
  final _fireStore = FirebaseFirestore.instance;
  String studentName;
  int studentID;
  int studentLevel;
  String studentAddress;
  String studentPhone;
  int studentGPA;
  String subjectChoice1 = 'Compiler Theory';
  String subjectChoice2 = 'Compiler Theory';
  String subjectChoice3 = 'Compiler Theory';
  String subjectChoice4 = 'Compiler Theory';
  String subjectChoice5 = 'Compiler Theory';
  String subjectChoice6 = 'Compiler Theory';

  List<DropdownMenuItem<String>> subjects = [
    DropdownMenuItem(
      child: Text('Compiler Theory'),
      value: 'Compiler Theory',
    ),
    DropdownMenuItem(
      child: Text('Expert System'),
      value: 'Expert System',
    ),
    DropdownMenuItem(
      child: Text('Computer Network'),
      value: 'Computer Network',
    ),
    DropdownMenuItem(
      child: Text('Image Processing'),
      value: 'Image Processing',
    ),
    DropdownMenuItem(
      child: Text('Modeling & Simulation'),
      value: 'Modeling & Simulation',
    ),
    DropdownMenuItem(
      child: Text('Artifical Intelliegence'),
      value: 'Artifical Intelliegence',
    ),
    DropdownMenuItem(
      child: Text('Computer Graphic'),
      value: 'Computer Graphic',
    ),
    DropdownMenuItem(
      child: Text('Formal Language'),
      value: 'Formal Language',
    ),
    DropdownMenuItem(
      child: Text('Logic Programming'),
      value: 'Logic Programming',
    ),
    DropdownMenuItem(
      child: Text('Software Engineering'),
      value: 'Software Engineering',
    ),
    DropdownMenuItem(
      child: Text('System Analysis'),
      value: 'System Analysis',
    ),
    DropdownMenuItem(
      child: Text('Distributed Computing'),
      value: 'Distributed Computing',
    ),
    DropdownMenuItem(
      child: Text('Neural Networks'),
      value: 'Neural Networks',
    ),
    DropdownMenuItem(
      child: Text('Data Structure'),
      value: 'Data Structure',
    ),
    DropdownMenuItem(
      child: Text('Object Oriented Programming'),
      value: 'Object Oriented Programming',
    ),
  ];

  void addNewSubjectsForStudents(String sub1, String sub2, String sub3,
      String sub4, String sub5, String sub6) {
    _fireStore
        .collection('Students')
        .doc('${widget.studentEmail}')
        .collection('Courses')
        .doc('$sub1')
        .set({
      'subject': ['Lamiaa', sub1, 'First Year']
    });
    _fireStore
        .collection('Students')
        .doc('${widget.studentEmail}')
        .collection('Courses')
        .doc('$sub2')
        .set({
      'subject': ['Lamiaa', sub2, 'First Year']
    });
    _fireStore
        .collection('Students')
        .doc('${widget.studentEmail}')
        .collection('Courses')
        .doc('$sub3')
        .set({
      'subject': ['Lamiaa', sub3, 'First Year']
    });
    _fireStore
        .collection('Students')
        .doc('${widget.studentEmail}')
        .collection('Courses')
        .doc('$sub4')
        .set({
      'subject': ['Lamiaa', sub4, 'First Year']
    });
    _fireStore
        .collection('Students')
        .doc('${widget.studentEmail}')
        .collection('Courses')
        .doc('$sub5')
        .set({
      'subject': ['Lamiaa', sub5, 'First Year']
    });
    _fireStore
        .collection('Students')
        .doc('${widget.studentEmail}')
        .collection('Courses')
        .doc('$sub6')
        .set({
      'subject': ['Lamiaa', sub6, 'First Year']
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0.0,
      ),
      body: BackgroundImage(
        image: 'images/sora5a.jpeg',
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Enter Student Information',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.black),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFiledLogIn(
                hideText: false,
                hintText: 'Name',
                onChange: (value) {
                  studentName = value;
                },
              ),
              TextFiledLogIn(
                hideText: false,
                hintText: 'ID',
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChange: (value) {
                  studentID = int.parse(value);
                },
              ),
              TextFiledLogIn(
                hideText: false,
                hintText: 'Level',
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChange: (value) {
                  studentLevel = int.parse(value);
                },
              ),
              TextFiledLogIn(
                hideText: false,
                hintText: 'Address',
                onChange: (value) {
                  studentAddress = value;
                },
              ),
              TextFiledLogIn(
                hideText: false,
                hintText: 'Phone',
                onChange: (value) {
                  studentPhone = value;
                },
              ),
              TextFiledLogIn(
                hideText: false,
                hintText: 'GPA',
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChange: (value) {
                  studentGPA = int.parse(value);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Add Student Courses',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: DropdownButton(
                  style: TextStyle(fontSize: 25.0),
                  dropdownColor: Color(0xFF06D6A0),
                  //icon: Icon(Icons.add),
                  isExpanded: true,
                  iconSize: 25.0,
                  value: subjectChoice1,
                  items: subjects,
                  onChanged: (value) {
                    setState(() {
                      subjectChoice1 = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: DropdownButton(
                  style: TextStyle(fontSize: 25.0),
                  dropdownColor: Color(0xFF06D6A0),
                  //icon: Icon(Icons.add),
                  isExpanded: true,
                  iconSize: 25.0,
                  value: subjectChoice2,
                  items: subjects,
                  onChanged: (value) {
                    setState(() {
                      subjectChoice2 = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: DropdownButton(
                  style: TextStyle(fontSize: 25.0),
                  dropdownColor: Color(0xFF06D6A0),
                  //icon: Icon(Icons.add),
                  isExpanded: true,
                  iconSize: 25.0,
                  value: subjectChoice3,
                  items: subjects,
                  onChanged: (value) {
                    setState(() {
                      subjectChoice3 = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: DropdownButton(
                  style: TextStyle(fontSize: 25.0),
                  dropdownColor: Color(0xFF06D6A0),
                  //icon: Icon(Icons.add),
                  isExpanded: true,
                  iconSize: 25.0,
                  value: subjectChoice4,
                  items: subjects,
                  onChanged: (value) {
                    setState(() {
                      subjectChoice4 = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: DropdownButton(
                  style: TextStyle(fontSize: 25.0),
                  dropdownColor: Color(0xFF06D6A0),
                  //icon: Icon(Icons.add),
                  isExpanded: true,
                  iconSize: 25.0,
                  value: subjectChoice5,
                  items: subjects,
                  onChanged: (value) {
                    setState(() {
                      subjectChoice5 = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: DropdownButton(
                  style: TextStyle(fontSize: 25.0),
                  dropdownColor: Color(0xFF06D6A0),
                  //icon: Icon(Icons.add),
                  isExpanded: true,
                  iconSize: 25.0,
                  value: subjectChoice6,
                  items: subjects,
                  onChanged: (value) {
                    setState(() {
                      subjectChoice6 = value;
                    });
                  },
                ),
              ),
              ButtonLogIn(
                buttonText: 'Add Student',
                onPress: () {
                  _fireStore
                      .collection('Students')
                      .doc('${widget.studentEmail}')
                      .set({
                    'name': studentName,
                    'address': studentAddress,
                    'gpa': studentGPA,
                    'id': studentID,
                    'level': studentLevel,
                    'phone': studentPhone
                  });
                  addNewSubjectsForStudents(
                      subjectChoice1,
                      subjectChoice2,
                      subjectChoice3,
                      subjectChoice4,
                      subjectChoice5,
                      subjectChoice6);
                  final messageBar = SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin:
                        EdgeInsets.only(bottom: 50.0, left: 20.0, right: 20.0),
                    backgroundColor: Color(0xFF06D6A0),
                    content: Text(
                      'Student Data Added Successfully',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(messageBar);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
// class DropMenu extends StatefulWidget {
//   String cartItem;
//   DropMenu({this.cartItem});
//   @override
//   _DropMenuState createState() => _DropMenuState();
// }
//
// class _DropMenuState extends State<DropMenu> {
//   String newValue = 'AI';
//   List<DropdownMenuItem<String>> subjects = [
//     DropdownMenuItem(
//       child: Text('Compiler Theory'),
//       value: 'Compiler Theory',
//     ),
//     DropdownMenuItem(
//       child: Text('AI'),
//       value: 'AI',
//     ),
//     DropdownMenuItem(
//       child: Text('Computer Network'),
//       value: 'Computer Network',
//     ),
//   ];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     //newValue = widget.cartItem;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 50.0),
//       child: DropdownButton(
//         style: TextStyle(fontSize: 25.0),
//         dropdownColor: Color(0xFF06D6A0),
//         //icon: Icon(Icons.add),
//         isExpanded: true,
//         iconSize: 25.0,
//         value: newValue,
//         items: subjects,
//         onChanged: (value) {
//           setState(() {
//             newValue = value;
//             widget.cartItem = value;
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => AddNewStudentAdminScreen(
//             //       a7a: widget.cartItem,
//             //     ),
//             //   ),
//             // );
//           });
//         },
//       ),
//     );
//   }
// }
