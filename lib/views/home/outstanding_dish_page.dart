import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/background_container.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/constants/uidata.dart';
import 'package:agofoods/views/home/widgets/outstanding_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutstandingDish extends StatelessWidget {
  const OutstandingDish({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        title: ReusableText(
          text: "MÓN NỔI BẬT",
          style: appStyle(13, kWhite, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: ListView(
            children: List.generate(restaurants.length, (i) {
              var restaurant = restaurants[i];
              return OutstandingTitle(restaurants: restaurant);
            }),
          ),
        ),
      ),
    );
  }
}
