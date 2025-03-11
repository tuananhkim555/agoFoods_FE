import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/constants/uidata.dart';
import 'package:agofoods/models/foods_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodTitle extends StatelessWidget {
  const FoodTitle({super.key, required this.foods, this.color});

  final FoodsModel foods;
  final Color? color;

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
              color: color??kOffWhite,
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
                            foods.imageUrl![0],
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
                        text: foods.title,
                        style: appStyle(11, kGrayDark, FontWeight.w500),
                      ),
                      ReusableText(
                        text: "Quán làm trong: ${foods.time}",
                        style: appStyle(11, kGreen, FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.7,
                        height: 16.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: foods.additives.length,
                            itemBuilder: (context, i) {
                              var additive = foods.additives[i];
                              return Container(
                                margin: EdgeInsets.only(right: 5.w),
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                decoration: BoxDecoration(
                                  color: kSecondaryLight,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9.r)),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: ReusableText(
                                      text: additive.title,
                                      style: appStyle(
                                          8, kGrayDark, FontWeight.w500),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 6.h,
            child: Container(
              width: 70.w,
              height: 25.h,
              decoration: BoxDecoration(
                color: kGreen,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: ReusableText(
                  text: formatPriceVND(foods.price ?? 0.0),
                  style: appStyle(12, kLightWhite, FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            right: 85.w,
            top: 6.h,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: Icon(
                    Boxicons.bx_cart_add,
                    size: 20.h,
                    color: kLightWhite,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
