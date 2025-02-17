import 'package:agofoods/common/custom_container.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: PreferredSize(preferredSize: Size.fromHeight(130.h), child: Container(height: 130)),
      body: SafeArea(
        child: CustomContainer(containerContent: Container()),
      )
    );
  }
}
