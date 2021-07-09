import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Constins.dart';

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
  String subjectChoice1 = 'None';
  String subjectChoice2 = 'None';
  String subjectChoice3 = 'None';
  String subjectChoice4 = 'None';
  String subjectChoice5 = 'None';
  String subjectChoice6 = 'None';
  List<DropdownMenuItem<String>> subjects = [
    DropdownMenuItem(
      child: Text('None'),
      value: 'None',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCourses();
  }

  void getCourses() async {
    await _fireStore.collection('Courses').get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach((element) {
          subjects.add(
            DropdownMenuItem(
              child: Text('${element.data()['name']}'),
              value: element.data()['name'],
            ),
          );
        });
      },
    );
  }

  void addNewSubjectsForStudents(String sub1, String sub2, String sub3,
      String sub4, String sub5, String sub6) {
    if (sub1 != sub2 &&
        sub1 != sub3 &&
        sub1 != sub4 &&
        sub1 != sub5 &&
        sub1 != sub6 &&
        sub2 != sub1 &&
        sub2 != sub3 &&
        sub2 != sub4 &&
        sub2 != sub5 &&
        sub2 != sub6 &&
        sub3 != sub1 &&
        sub3 != sub2 &&
        sub3 != sub4 &&
        sub3 != sub5 &&
        sub3 != sub6 &&
        sub4 != sub1 &&
        sub4 != sub2 &&
        sub4 != sub3 &&
        sub4 != sub5 &&
        sub4 != sub6 &&
        sub5 != sub1 &&
        sub5 != sub2 &&
        sub5 != sub3 &&
        sub5 != sub4 &&
        sub5 != sub6 &&
        sub6 != sub1 &&
        sub6 != sub2 &&
        sub6 != sub3 &&
        sub6 != sub4 &&
        sub6 != sub5) {
      if (sub1 != 'None') {
        _fireStore.collection('Courses').get().then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            if (sub1 == element.data()['name']) {
              int subjectLevel = element.data()['level'];
              String subjectDoctor = element.data()['doctor'];
              _fireStore
                  .collection('Students')
                  .doc('${widget.studentEmail}')
                  .collection('Courses')
                  .doc('$sub1')
                  .set({
                'subject': [subjectDoctor, sub1, subjectLevel]
              });
            }
          });
        });
      }
      if (sub2 != 'None') {
        _fireStore.collection('Courses').get().then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            if (sub2 == element.data()['name']) {
              int subjectLevel = element.data()['level'];
              String subjectDoctor = element.data()['doctor'];
              _fireStore
                  .collection('Students')
                  .doc('${widget.studentEmail}')
                  .collection('Courses')
                  .doc('$sub2')
                  .set({
                'subject': [subjectDoctor, sub2, subjectLevel]
              });
            }
          });
        });
      }
      if (sub3 != 'None') {
        _fireStore.collection('Courses').get().then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            if (sub3 == element.data()['name']) {
              int subjectLevel = element.data()['level'];
              String subjectDoctor = element.data()['doctor'];
              _fireStore
                  .collection('Students')
                  .doc('${widget.studentEmail}')
                  .collection('Courses')
                  .doc('$sub3')
                  .set({
                'subject': [subjectDoctor, sub3, subjectLevel]
              });
            }
          });
        });
      }
      if (sub4 != 'None') {
        _fireStore.collection('Courses').get().then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            if (sub4 == element.data()['name']) {
              int subjectLevel = element.data()['level'];
              String subjectDoctor = element.data()['doctor'];
              _fireStore
                  .collection('Students')
                  .doc('${widget.studentEmail}')
                  .collection('Courses')
                  .doc('$sub4')
                  .set({
                'subject': [subjectDoctor, sub4, subjectLevel]
              });
            }
          });
        });
      }
      if (sub5 != 'None') {
        _fireStore.collection('Courses').get().then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            if (sub5 == element.data()['name']) {
              int subjectLevel = element.data()['level'];
              String subjectDoctor = element.data()['doctor'];
              _fireStore
                  .collection('Students')
                  .doc('${widget.studentEmail}')
                  .collection('Courses')
                  .doc('$sub5')
                  .set({
                'subject': [subjectDoctor, sub5, subjectLevel]
              });
            }
          });
        });
      }
      if (sub6 != 'None') {
        _fireStore.collection('Courses').get().then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            if (sub6 == element.data()['name']) {
              int subjectLevel = element.data()['level'];
              String subjectDoctor = element.data()['doctor'];
              _fireStore
                  .collection('Students')
                  .doc('${widget.studentEmail}')
                  .collection('Courses')
                  .doc('$sub6')
                  .set({
                'subject': [subjectDoctor, sub6, subjectLevel]
              });
            }
          });
        });
      }
      final messageBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 50.0, left: 20.0, right: 20.0),
        backgroundColor: kAdminColor,
        content: Text(
          'Student Data Added Successfully',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(messageBar);
    } else {
      Alert(
        context: context,
        style: alertStyle,
        title:
            'You have Duplicate a Subject. \n Please check the subjects and try again.',
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAdminColor,
        centerTitle: true,
        title: Text(
          'Add Student',
          style: kAppBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0.0,
      ),
      body: BackgroundImage(
        image: 'images/B2.jpeg',
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Enter Student Information',
                textAlign: TextAlign.center,
                style: kTextNoBackground,
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'Name',
                onChange: (value) {
                  studentName = value;
                },
              ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'ID',
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChange: (value) {
                  studentID = int.parse(value);
                },
              ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'Level',
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChange: (value) {
                  studentLevel = int.parse(value);
                },
              ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'Address',
                onChange: (value) {
                  studentAddress = value;
                },
              ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'Phone',
                onChange: (value) {
                  studentPhone = value;
                },
              ),
              TextFieldForDGEST(
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
                style: kTextNoBackground,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: DropdownButton(
                  style: TextStyle(fontSize: 25.0),
                  dropdownColor: kAdminColor,
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
                  dropdownColor: kAdminColor,
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
                  dropdownColor: kAdminColor,
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
                  dropdownColor: kAdminColor,
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
                  dropdownColor: kAdminColor,
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
                  dropdownColor: kAdminColor,
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
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75.0),
                child: ButtonsForDGEST(
                  buttonColor: kAdminColor,
                  buttonText: 'Add Student',
                  onPress: () {
                    if (studentName != null &&
                        studentAddress != null &&
                        studentGPA != null &&
                        studentID != null &&
                        studentLevel != null &&
                        studentPhone != null) {
                      _fireStore
                          .collection('Students')
                          .doc('${widget.studentEmail}')
                          .set({
                        'name': studentName,
                        'address': studentAddress,
                        'gpa': studentGPA,
                        'id': studentID,
                        'level': studentLevel,
                        'phone': studentPhone,
                        'photo':
                            'https://firebasestorage.googleapis.com/v0/b/dgest-39c26.appspot.com/o/ImagesProfile%2Fdefault_photo.jpg?alt=media&token=3870fd5b-7700-4976-b1c1-e69ecd720f67'
                      });
                      addNewSubjectsForStudents(
                          subjectChoice1,
                          subjectChoice2,
                          subjectChoice3,
                          subjectChoice4,
                          subjectChoice5,
                          subjectChoice6);
                      Navigator.pop(context);
                    } else {
                      Alert(
                        context: context,
                        style: alertStyle,
                        title:
                            'Please make sure that the Data is added correctly.',
                      ).show();
                    }
                  },
                ),
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
