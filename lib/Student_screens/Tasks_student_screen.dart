//TODO: hn3mel hena desgin 2 screen f desgin gehad. TB3N sarmad bs ale hy3melha !
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Student_screens/Home_student_screen.dart';
import 'package:DGEST/Constins.dart';

class TaskStudentScreen extends StatefulWidget {
  @override
  _TaskStudentScreenState createState() => _TaskStudentScreenState();
}

class _TaskStudentScreenState extends State<TaskStudentScreen> {
  var selectedCard = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45.0),
                      bottomRight: Radius.circular(45.0)),
                  color: Color(0xFF06D6A0),
                ),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Oct,2020',
                    ),
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 40, bottom: 70, right: 7, left: 7),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              _light_and_of_week('1', 'week'),
                              SizedBox(
                                width: 10,
                              ),
                              _light_and_of_week('2', 'week'),
                              SizedBox(
                                width: 10,
                              ),
                              _light_and_of_week('3', 'week'),
                              SizedBox(
                                width: 10,
                              ),
                              _light_and_of_week('4', 'week'),
                              SizedBox(
                                width: 10,
                              ),
                              _light_and_of_week('5', 'week'),
                              SizedBox(
                                width: 10,
                              ),
                              _light_and_of_week('6', 'week'),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Compiler',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height - 180,
                  child: ListView(
                    children: <Widget>[
                      _tasks("sheet 1"),
                      _tasks("sheet 2"),
                      _tasks("sheet 3"),
                      _tasks("sheet 4"),
                      _tasks("sheet 5"),
                      _tasks("sheet 6"),
                      _tasks("sheet 7"),
                      _tasks("sheet 8"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _light_and_of_week(String cardTitle, String info) {
    return InkWell(
      onTap: () {
        SelectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardTitle == selectedCard ? Color(0xFF06D6A0) : Colors.white,
          border: Border.all(
              color: cardTitle == selectedCard
                  ? Colors.transparent
                  : Colors.grey.withOpacity(0.3),
              style: BorderStyle.solid,
              width: 5),
        ),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 40, top: 20),
              child: Text(
                cardTitle,
                style: TextStyle(
                    fontSize: 20,
                    color:
                        cardTitle == selectedCard ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    info,
                    style: TextStyle(
                      fontSize: 20,
                      color: cardTitle == selectedCard
                          ? Colors.white
                          : Colors.black,
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

  SelectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }

  Widget _tasks(String task) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        task,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.dehaze),
              color: Colors.black,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
