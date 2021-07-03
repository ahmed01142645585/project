import 'package:flutter/material.dart';
import 'package:DGEST/Constins.dart';

class ListDesign extends StatelessWidget {
  ListDesign(
      {@required this.drText,
      @required this.courseText,
      @required this.yearSemster});
  final String drText;
  final String courseText;
  final String yearSemster;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('images/default_profile.jpg'),
          radius: 30.0,
        ),
        Text(
          drText,
          style: kHSSMainListTextStyle,
        ),
        Text(
          courseText,
          style: kHSSMainListTextStyle,
        ),
        Text(
          yearSemster,
          style: kHSSMainListTextStyle,
        )
      ],
    );
  }
}

class WidgetContainers extends StatelessWidget {
  WidgetContainers({this.width, this.onTap, this.child, this.height});
  final double width;
  final Function onTap;
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(13.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color(0xFF06D6A0),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}

// class SnackBarMessages extends StatelessWidget {
//   SnackBarMessages({@required this.barTitle});
//   final String barTitle;
//
//   @override
//   Widget build(BuildContext context) {
//     return SnackBar(
//       behavior: SnackBarBehavior.floating,
//       margin: EdgeInsets.only(bottom: 50.0, left: 20.0, right: 20.0),
//       backgroundColor: Color(0xFF06D6A0),
//       content: Text(
//         barTitle,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           fontSize: 25.0,
//           color: Colors.black,
//         ),
//       ),
//       duration: Duration(seconds: 3),
//     );
//   }
// }

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
