

import 'package:agofoods/common/shimmers/shimmer_widget.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeabryShimmer extends StatelessWidget {
  const NeabryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 10),
      height: 190.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return
              ShimmerWidget(
                shimmerWidth: width * 0.8,
                shimmerHeight: 60.w,
                shimmerRadius: 12);        
        },
      ),
    );
}
}