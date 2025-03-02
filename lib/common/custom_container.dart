// ignore_for_file: must_be_immutable

import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, required this.containerContent, this.color});

  Widget containerContent;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      width: width,
      child: Container(
        width: width,
        color: color??kOffWhite,
        child: SingleChildScrollView(
          child: containerContent,
        ),
      ),
      // ),
    );
  }
}
