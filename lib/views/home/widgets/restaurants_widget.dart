import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget(
      {super.key,
      required this.image,
      required this.logo,
      required this.title,
      required this.time,
      required this.rating,
      this.onTap});

  final String image;
  final String logo;
  final String title;
  final String time;
  final dynamic rating;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double ratingValue =
        rating is String ? double.tryParse(rating) ?? 0.0 : rating.toDouble();

    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: Container(
            width: width * .65,
            height: 180.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: kLightWhite,
            ),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: SizedBox(
                          height: 112.h,
                          width: width * .8,
                          child: Image.network(
                            image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Positioned(
                          right: 10.w,
                          top: 10.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.r),
                            child: Container(
                              color: kLightWhite,
                              child: Padding(
                                padding: EdgeInsets.all(2.h),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: Image.network(
                                    logo,
                                    fit: BoxFit.cover,
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                          text: title,
                          style: appStyle(14, kDark, FontWeight.w500)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(
                              text: "Giờ mở cửa",
                              style: appStyle(9, kGray, FontWeight.w500)),
                          ReusableText(
                              text: time,
                              style: appStyle(9, kGreen, FontWeight.w700)),
                        ],
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: ratingValue,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: kPrimary,
                            ),
                            itemCount: 5,
                            itemSize: 13.h,
                          ),
                          SizedBox(width: 10.w),
                          ReusableText(
                            text: "+ $rating bình luận và đánh giá ",
                            style: appStyle(9, kGray, FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
