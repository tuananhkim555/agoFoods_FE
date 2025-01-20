import 'package:agofoods/common/background_container.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/constants/uidata.dart';
import 'package:agofoods/views/categories/category_page.dart';
import 'package:agofoods/views/categories/widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kOffWhite,
          title: ReusableText(
            text: 'DANH MỤC CÁC MÓN',
            style: appStyle(16, kGray, FontWeight.w600),
          ),
        ),
        body: BackgroundContainer(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            height: height,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(categories.length, (i) {
              var category = categories[i];
              return CategoryTile(category: category);
            }),
            ),
          ),
        ));
  }
}
