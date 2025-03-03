import 'package:agofoods/common/custom_appbar.dart';
import 'package:agofoods/common/custom_container.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kOffWhite,
        body: SafeArea(
          child: CustomContainer(containerContent: Container()),
        ));
  }
}
