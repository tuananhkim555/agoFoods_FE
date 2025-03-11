// ignore_for_file: non_constant_identifier_names

import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/controllers/category_controller.dart';
import 'package:agofoods/models/categories.dart';
import 'package:agofoods/views/categories/all_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>(); // Sử dụng Get.find

    return GestureDetector(
      onTap: () {
        Get.forceAppUpdate();
        if (category.value == 'tat_ca') {
          Get.to(
            () => const AllCategories(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 300),
          );
        } else {
          controller.setCategory(category.id ?? '', category.title ?? '',
              category.type ?? CategoriesModel.TYPE_FOOD);
        }
        print("Selected category: ${category.value}");
      },
      child: Obx(() => Container(
            margin: EdgeInsets.only(right: 1.w, left: 2.w),
            padding: EdgeInsets.only(top: 5.h),
            width: width * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: controller.categoryValue == category.id
                    ? kPrimary
                    : kOffWhite,
                width: .5.w,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 35.h,
                  child: Image.network(
                    category.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 7.h),
                ReusableText(
                  text: category.title ?? '',
                  style: appStyle(11, kGrayDark, FontWeight.w600),
                  color: kGrayDark,
                ),
              ],
            ),
          )),
    );
  }
}
