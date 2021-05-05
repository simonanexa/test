import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final double fontSize;
  final  String fontFamily;

  CustomText({this.fontSize, this.fontFamily});

  @override
  Widget build(BuildContext context) {
    print("Font size: " + fontSize.toString());
    print("Font family: " + fontFamily);
    return Text(
      'It is not for testing',

      style: TextStyle(

        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
    );
  }
}
