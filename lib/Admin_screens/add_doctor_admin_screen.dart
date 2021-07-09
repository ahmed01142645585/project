import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Constins.dart';

class AddNewDoctorAdminScreen extends StatefulWidget {
  final String doctorEmail;
  AddNewDoctorAdminScreen({@required this.doctorEmail});
  @override
  _AddNewDoctorAdminScreenState createState() =>
      _AddNewDoctorAdminScreenState();
}

class _AddNewDoctorAdminScreenState extends State<AddNewDoctorAdminScreen> {
  final _fireStore = FirebaseFirestore.instance;
  String doctorName;
  int doctorID;
  String doctorAddress;
  String doctorPhone;
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

  void addNewSubjectsForDoctors(String sub1, String sub2, String sub3,
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
              print('${element.id}');
              _fireStore
                  .collection('Doctors')
                  .doc('${widget.doctorEmail}')
                  .collection('Courses')
                  .doc('$sub1')
                  .set({
                'subject': [doctorName, sub1, subjectLevel]
              });
              _fireStore
                  .collection('Courses')
                  .doc('${element.id}')
                  .update({'doctor': doctorName});
            }
          });
        });
      }
      if (sub2 != 'None') {
        _fireStore.collection('Courses').get().then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            if (sub2 == element.data()['name']) {
              int subjectLevel = element.data()['level'];
              _fireStore
                  .collection('Doctors')
                  .doc('${widget.doctorEmail}')
                  .collection('Courses')
                  .doc('$sub2')
                  .set({
                'subject': [doctorName, sub2, subjectLevel]
              });
              _fireStore
                  .collection('Courses')
                  .doc('${element.id}')
                  .update({'doctor': doctorName});
            }
          });
        });
      }
      if (sub3 != 'None') {
        _fireStore.collection('Courses').get().then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            if (sub3 == element.data()['name']) {
              int subjectLevel = element.data()['level'];
              _fireStore
                  .collection('Doctors')
                  .doc('${widget.doctorEmail}')
                  .collection('Courses')
                  .doc('$sub3')
                  .set({
                'subject': [doctorName, sub3, subjectLevel]
              });
              _fireStore
                  .collection('Courses')
                  .doc('${element.id}')
                  .update({'doctor': doctorName});
            }
          });
        });
      }
      if (sub4 != 'None') {
        _fireStore.collection('Courses').get().then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            if (sub4 == element.data()['name']) {
              int subjectLevel = element.data()['level'];
              _fireStore
                  .collection('Doctors')
                  .doc('${widget.doctorEmail}')
                  .collection('Courses')
                  .doc('$sub4')
                  .set({
                'subject': [doctorName, sub4, subjectLevel]
              });
              _fireStore
                  .collection('Courses')
                  .doc('${element.id}')
                  .update({'doctor': doctorName});
            }
          });
        });
      }
      if (sub5 != 'None') {
        _fireStore.collection('Courses').get().then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            if (sub5 == element.data()['name']) {
              int subjectLevel = element.data()['level'];
              _fireStore
                  .collection('Doctors')
                  .doc('${widget.doctorEmail}')
                  .collection('Courses')
                  .doc('$sub5')
                  .set({
                'subject': [doctorName, sub5, subjectLevel]
              });
              _fireStore
                  .collection('Courses')
                  .doc('${element.id}')
                  .update({'doctor': doctorName});
            }
          });
        });
      }
      if (sub6 != 'None') {
        _fireStore.collection('Courses').get().then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            if (sub6 == element.data()['name']) {
              int subjectLevel = element.data()['level'];
              _fireStore
                  .collection('Doctors')
                  .doc('${widget.doctorEmail}')
                  .collection('Courses')
                  .doc('$sub6')
                  .set({
                'subject': [doctorName, sub6, subjectLevel]
              });
              _fireStore
                  .collection('Courses')
                  .doc('${element.id}')
                  .update({'doctor': doctorName});
            }
          });
        });
      }
      final messageBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 50.0, left: 20.0, right: 20.0),
        backgroundColor: kAdminColor,
        content: Text(
          'Doctor Data Added Successfully',
          textAlign: TextAlign.center,
          style: kTextNoBackground,
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
          'Add Doctor',
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
                'Enter Doctor Information',
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
                  doctorName = value;
                },
              ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'ID',
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChange: (value) {
                  doctorID = int.parse(value);
                },
              ),
              // TextFiledLogIn(
              //   hideText: false,
              //   hintText: 'Level',
              //   inputFormat: <TextInputFormatter>[
              //     FilteringTextInputFormatter.digitsOnly
              //   ],
              //   onChange: (value) {
              //     studentLevel = int.parse(value);
              //   },
              // ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'Address',
                onChange: (value) {
                  doctorAddress = value;
                },
              ),
              TextFieldForDGEST(
                hideText: false,
                hintText: 'Phone',
                onChange: (value) {
                  doctorPhone = value;
                },
              ),
              // TextFiledLogIn(
              //   hideText: false,
              //   hintText: 'GPA',
              //   inputFormat: <TextInputFormatter>[
              //     FilteringTextInputFormatter.digitsOnly
              //   ],
              //   onChange: (value) {
              //     studentGPA = int.parse(value);
              //   },
              // ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Add Doctor Courses',
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
                  buttonText: 'Add Doctor',
                  onPress: () {
                    if (doctorName != null &&
                        doctorAddress != null &&
                        doctorID != null &&
                        doctorPhone != null) {
                      _fireStore
                          .collection('Doctors')
                          .doc('${widget.doctorEmail}')
                          .set({
                        'name': doctorName,
                        'address': doctorAddress,
                        'id': doctorID,
                        'phone': doctorPhone,
                        'photo':
                            'https://firebasestorage.googleapis.com/v0/b/dgest-39c26.appspot.com/o/ImagesProfile%2Fdefault_photo.jpg?alt=media&token=3870fd5b-7700-4976-b1c1-e69ecd720f67'
                      });
                      addNewSubjectsForDoctors(
                          subjectChoice1,
                          subjectChoice2,
                          subjectChoice3,
                          subjectChoice4,
                          subjectChoice5,
                          subjectChoice6);
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
