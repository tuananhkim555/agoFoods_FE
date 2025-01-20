import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle appStyle(double size, Color color, FontWeight fw) {
  return TextStyle(
    fontSize: size.sp,
    color: color,
    fontWeight: fw,
    fontFamily: 'Poppins',
  );
}

TextStyle headingStyle(double size, Color color, FontWeight fw) {
  return TextStyle(
    fontSize: size.sp,
    color: color,
    fontWeight: fw,
    fontFamily: 'Poppins',
    height: 1.3,
  );
}

TextStyle titleStyle() {
  return TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );
}

TextStyle subTitleStyle() {
  return TextStyle(
    fontSize: 14.sp,
    color: Colors.grey,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
  );
}

TextStyle bodyStyle() {
  return TextStyle(
    fontSize: 12.sp,
    color: Colors.black87,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    height: 1.5,
  );
}

TextStyle buttonStyle() {
  return TextStyle(
    fontSize: 14.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    letterSpacing: 1,
  );
}
