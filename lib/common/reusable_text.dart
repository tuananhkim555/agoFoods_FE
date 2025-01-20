import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final TextAlign? textAlign;

  const ReusableText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ??
          TextStyle(
            fontSize: fontSize?.sp ?? 14.sp,
            color: color ?? Colors.black,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
    );
  }
}
