import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static const primaryColor = Color(0xFFFF904B); // #B85042
  static const secondaryColor = Color(0xFFFDBF50); // #E7E8D1
  static const accentColor = Color(0xFFA7BEAE);
  static const lightGrey = Color.fromARGB(255, 217, 217, 217);
  static const darkGrey = Color.fromARGB(255, 98, 87, 87);
  static const white = Colors.white;
  static const black = Colors.black;
  static const green = Colors.green;
  static const iconColor = Color.fromARGB(255, 190, 181, 181);
  static const fillColor = Color(0xFFF4F4F8);
  static const bgColor = Color(0xFFF1F1F1);
  static const amber = Colors.amber;

  static final titleStyle = TextStyle(
    color: Color(0xFFFF904B),
    fontSize: 20.sp,
    fontFamily: "Edu NSW ACT Foundation",
    fontWeight: FontWeight.bold,
  );

  static final button_text = TextStyle(
    color: white,
    fontSize: //20.sp,
        16.sp,
    fontFamily: "Rubik",
    //"Roboto",
    fontWeight: FontWeight.w700,
  );

  static final paragraphStyle = TextStyle(
    color: darkGrey,
    height: 1.5,
    fontSize: 15.sp,
    fontFamily: "Rubik",
    fontWeight: FontWeight.w300,
  );

  static final labelStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    fontFamily: "Rubik",
    color: AppTheme.black,
  );

  static final textFieldEnableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Color(0xffff904b), width: 1.0),
  );
  static final textFieldFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Color(0xffff904b), width: 1.0),
  );

  static final hintTextStyle = TextStyle(color: darkGrey, fontSize: 18.sp);
}
