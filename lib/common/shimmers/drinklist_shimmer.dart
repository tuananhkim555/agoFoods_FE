import 'package:agofoods/common/shimmers/shimmer_widget.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrinkListShimmer extends StatelessWidget {
  const DrinkListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 10),
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return ShimmerWidget(
              shimmerWidth: width, 
              shimmerHeight: 60.w, 
              shimmerRadius: 12);
        },
      ),
    );
  }
}
