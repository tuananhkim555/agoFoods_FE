import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.only(bottom: 200.h),
          child: LottieBuilder.asset(
            "assets/anime/delivery2.json",
            width: width,
            height: height / 2,
          ),
        ),
      ),
    );
  }
}
