import 'package:flutter/material.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../Constins.dart';

class AttendanceDoctorScreen extends StatefulWidget {
  final String courseName;
  final String courseDay;
  final int courseHall;
  AttendanceDoctorScreen(
      {@required this.courseName,
      @required this.courseDay,
      @required this.courseHall});
  @override
  _AttendanceDoctorScreenState createState() => _AttendanceDoctorScreenState();
}

var formatter = new DateFormat('EEEEE', 'en_US').format(now);

class _AttendanceDoctorScreenState extends State<AttendanceDoctorScreen> {
  final _fireStore = FirebaseFirestore.instance;

  Widget readAttendance() {
    return FutureBuilder(
      future: _fireStore
          .collection('Attendance')
          .doc('lecture attendance')
          .collection('week$selectedCard')
          .doc('${widget.courseDay}')
          .collection('${widget.courseName}')
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.hasData) {
          final documents = snapshot.data.docs;
          List<AttendanceWidget> courseWidgets = [];
          for (var field in documents) {
            String studentEmail = field.get('email');
            Timestamp studentArrive = field.get('arrive');
            Timestamp studentLeave = field.get('leave');
            DateTime arriveTime = studentArrive.toDate();
            DateTime leaveTime = studentLeave.toDate();
            var arrive = DateFormat.Hm().format(arriveTime);
            var leave = DateFormat.Hm().format(leaveTime);
            final courseWidget = AttendanceWidget(
                studentName: '$studentEmail', studentTime: '$arrive - $leave');
            courseWidgets.add(courseWidget);
          }
          return ListView(
            children: courseWidgets,
          );
        }
        return AttendanceWidget(
            studentName: 'LOADING', studentTime: 'LOADING - LOADING');
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //readAttendanceFull();
  }

  void readAttendanceFull() {
    _fireStore
        .collection('Attendance')
        .doc('lecture attendance')
        .collection('week$selectedCard')
        .get()
        .then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          if (result.data()['${widget.courseName}'] == widget.courseName) {
            result.id;
          }
        });
      },
    );
  }

  // .doc('Thurday')
  // .collection('Computer Graphic')
  // .get();
  // Column(
  // children: [
  // WidgetContainers(
  // widgetColor: kDoctorColor,
  // height: 50.0,
  // child: Row(
  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  // children: [
  // Text(
  // 'Hall: $hallNumber',
  // style: TextStyle(fontSize: 20.0),
  // ),
  // Text(
  // 'Day: $formatter',
  // style: TextStyle(fontSize: 20.0),
  // )
  // ],
  // ),
  // ),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDoctorColor,
        title: Text(
          '${widget.courseName}',
          style: kAppBarTextStyle,
        ),
        centerTitle: true,
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
        image: 'images/B4.jpeg',
        child: SafeArea(
          child: Column(
            children: [
              WidgetContainers(
                widgetColor: kDoctorColor,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Hall: ${widget.courseHall}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      'Day: ${widget.courseDay}',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
              ),
              WidgetContainers(
                widgetColor: kDoctorColor,
                //width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 200,
                child: Padding(
                    padding: const EdgeInsets.all(15.0), child: readAttendance()
                    // child: ListView(
                    //   children: [
                    //     // AttendanceWidget('ahmedsarmad@gmail.com', '9:15 - 10:40'),
                    //     // AttendanceWidget('ahmedtarek@gmail.com', '9:00 - 10:20'),
                    //     // AttendanceWidget('gehadmagdy@gmail.com', '9:12 - 10:36'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //     // AttendanceWidget('Ahmed Sarmad Ali', 'Time:9:00-11:00'),
                    //   ],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: ana 3mlt al class fdl ba2a nst3melh bdl ale mktob kter fo2 da.
class AttendanceWidget extends StatelessWidget {
  AttendanceWidget({this.studentName, this.studentTime});
  final String studentName;
  final String studentTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text(
              studentName,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              width: 30.0,
            ),
            Text(
              studentTime,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        Divider(
          thickness: 2.0,
          color: Colors.black,
        ),
      ],
    );
  }
}
