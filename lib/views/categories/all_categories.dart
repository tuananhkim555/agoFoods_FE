import 'package:agofoods/common/background_container.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/common/shimmers/foodlist_shimmer.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/constants/uidata.dart';
import 'package:agofoods/views/categories/widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agofoods/hooks/fetch_all_catogories.dart';


import '../../models/categories.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllCategories();
    List<CategoriesModel>? categories = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kOffWhite,
          title: ReusableText(
            text: 'DANH MỤC CÁC MÓN',
            style: appStyle(16, kPrimary, FontWeight.w600),
          ),
        ),
        body: BackgroundContainer(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            height: height,
            child: isLoading ? const FoodListShimmer() : ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(categories!.length, (i) {
              var category = categories[i];
              return CategoryTile(category: category, textColor: kPrimary,);
            }),
            ),
          ),
        ));
  }
}
