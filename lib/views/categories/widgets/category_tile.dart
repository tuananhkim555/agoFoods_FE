import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/models/categories.dart';
import 'package:agofoods/views/categories/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  final CategoriesModel category;
  final Color? textColor;

  const CategoryTile({
    Key? key,
    required this.category,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(
          () => const CategoryPage(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 300),
        );
      },
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: kGrayLight,
        child: Image.network(
          category.imageUrl ?? "",
          fit: BoxFit.contain,
        ),
      ),
      title: ReusableText(
        text: category.title ?? "",
        style: appStyle(12, textColor ?? kGrayDark, FontWeight.w500),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: kGray,
        size: 15.r,
      ),
    );
  }
}
