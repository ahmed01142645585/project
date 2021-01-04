import 'package:flutter/material.dart';

class HomeStudentScreen extends StatefulWidget {
  @override
  _HomeStudentScreenState createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        image: 'images/pexels-philippe-donn-1257860.jpg',
        child: SafeArea(
          child: Container(),
        ),
      ),
    );
  }
}

//TODO: n8yr mkan al class da 3shan hns3mlo fkol 7ata b3den.
class BackgroundImage extends StatelessWidget {
  BackgroundImage({@required this.image, @required this.child});
  final String image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
