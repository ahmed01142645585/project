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
          style: kTextStyle,
        ),
        Text(
          courseText,
          style: kTextStyle,
        ),
        Text(
          yearSemster,
          style: kTextStyle,
        )
      ],
    );
  }
}

class WidgetContainers extends StatelessWidget {
  WidgetContainers(
      {@required this.widgetColor,
      this.width,
      this.onTap,
      this.child,
      this.height});
  final double width;
  final Function onTap;
  final Widget child;
  final double height;
  final Color widgetColor;

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
          color: widgetColor,
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

class ButtonsForDGEST extends StatelessWidget {
  ButtonsForDGEST(
      {@required this.buttonText,
      @required this.buttonColor,
      this.buttonPadding,
      @required this.onPress});
  final String buttonText;
  final EdgeInsetsGeometry buttonPadding;
  final Function onPress;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
            padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(buttonPadding)),
        onPressed: onPress,
        child: Text(
          buttonText,
          style: kAppBarTextStyle,
        ),
      ),
    );
  }
}

class TextFieldForDGEST extends StatelessWidget {
  TextFieldForDGEST(
      {@required this.hintText,
      this.hideText,
      this.onChange,
      this.inputFormat});
  final String hintText;
  final bool hideText;
  final Function onChange;
  final List inputFormat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      child: TextField(
        obscureText: hideText,
        inputFormatters: inputFormat,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black),
        onChanged: onChange,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
