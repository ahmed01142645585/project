import 'package:flutter/material.dart';

class MainStudentScreen extends StatefulWidget {
  @override
  _MainStudentScreenState createState() => _MainStudentScreenState();
}

class _MainStudentScreenState extends State<MainStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello, tarek!'),
      ),
    );
  }
}
