import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrinkWidget extends StatelessWidget {
  const DrinkWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.time,
      required this.price,
      required this.onTap});

  final String image;
  final String title;
  final String time;
  final String price;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: Container(
            width: width * .45,
            height: 185.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: kLightWhite,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(6.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SizedBox(
                      height: 95.h,
                      width: double.infinity,
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ReusableText(
                                text: title,
                                style: appStyle(12, kDark, FontWeight.w500),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            ReusableText(
                              text: price,
                              style: appStyle(10, kPrimary, FontWeight.w700),
                            ),
                          ]),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(
                            text: "Giờ mở cửa",
                            style: appStyle(9, kGray, FontWeight.w500),
                          ),
                          ReusableText(
                            text: time,
                            style: appStyle(9, kGreen, FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
