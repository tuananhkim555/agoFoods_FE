import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/constants/uidata.dart';
import 'package:agofoods/models/drinks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrinkTitle extends StatelessWidget {
  const DrinkTitle({super.key, required this.drinks});

  final DrinksModel drinks;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Fix width issue

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
            child: Padding(
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
                          child: drinks.imageUrl != null &&
                                  drinks.imageUrl!.isNotEmpty
                              ? Image.network(
                                  drinks.imageUrl![0],
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  color: Colors.grey[300],
                                  child: Icon(Icons.image, size: 40),
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 4.w, bottom: 4.h),
                            color: kGrayDark.withOpacity(0.6),
                            height: 16.h,
                            width: 70.w,
                            child: RatingBarIndicator(
                              rating: drinks.rating ?? 5, // Fix null rating
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: drinks.title ?? "Chưa có tên",
                          style: appStyle(11, kGrayDark, FontWeight.w500),
                        ),
                        ReusableText(
                          text: "Pha chế trong: ${drinks.time ?? 'N/A'}",
                          style: appStyle(11, kGreen, FontWeight.bold),
                        ),
                        if (drinks.additives != null &&
                            drinks.additives!.isNotEmpty)
                          SizedBox(
                            height: 16.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: drinks.additives!.length,
                              itemBuilder: (context, i) {
                                var additive = drinks.additives![i];
                                return Container(
                                  margin: EdgeInsets.only(right: 5.w),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
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
                              },
                            ),
                          ),
                      ],
                    ),
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
                  text: formatPriceVND(drinks.price ?? 0.0),
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
