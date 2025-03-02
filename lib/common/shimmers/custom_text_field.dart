import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget  extends StatelessWidget {
  const CustomTextWidget ({super.key, this.keyboardType, this.controller, this.onEditingComplete, this.obscureText, this.suffixIcon, this.validator, this.prefixIcon, this.hintText, required EdgeInsets contentPadding});

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: kGray, width: 0.5),
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: TextFormField(
        controller: controller,
          keyboardType: keyboardType,
          onEditingComplete: onEditingComplete,
          obscureText: obscureText??false,
          cursorHeight: 20.h,
          style: appStyle(12, kDark, FontWeight.normal),
          validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: appStyle(11, kDark, FontWeight.normal),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
      ),
    );
  }
}