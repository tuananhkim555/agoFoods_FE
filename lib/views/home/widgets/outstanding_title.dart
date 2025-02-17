import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutstandingTitle extends StatelessWidget {
  const OutstandingTitle({super.key, required this.restaurants});

  final dynamic restaurants;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: width,
            decoration: BoxDecoration(
              color: kOffWhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 70.w,
                          height: 70.h,
                          child: Image.network(
                            restaurants['imageUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 4.w, bottom: 4.h),
                            color: kGrayDark.withOpacity(0.6),
                            height: 16.h,
                            width: width,
                            child: RatingBarIndicator(
                              rating: 5,
                              itemCount: 5,
                              itemBuilder: (context, i) => const Icon(
                                Icons.star,
                                color: kSecondary,
                              ),
                              itemSize: 12.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: restaurants['title'],
                        style: appStyle(11, kGrayDark, FontWeight.w500),
                      ),
                      ReusableText(
                        text: "Giờ mở cửa: ${restaurants['time']}",
                        style: appStyle(11, kGreen, FontWeight.w400),
                      ),
                      SizedBox(
                        width: width * 0.7,
                        child: Text(
                          restaurants['coords']['address'],
                          style: appStyle(9, kGray, FontWeight.w400),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 6.h,
            child: Container(
              width: 60.w,
              height: 25.h,
              decoration: BoxDecoration(
                color: restaurants['isAvailable'] == true ||
                        restaurants['isAvailable'] == null
                    ? kGreen
                    : kPrimary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: ReusableText(
                  text: restaurants['isAvailable'] == true ||
                          restaurants['isAvailable'] == null
                      ? 'Mở cửa'
                      : 'Đóng cửa',
                  style: appStyle(12, kLightWhite, FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
