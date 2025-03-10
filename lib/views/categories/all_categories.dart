import 'package:agofoods/common/background_container.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/common/shimmers/foodlist_shimmer.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/common/app_style.dart';
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
    final isLoading = hookResult.isLoading;
    List<CategoriesModel>? categories = hookResult.data ?? [];

    // Thay vì xóa, chúng ta sẽ lọc khi hiển thị
    final displayCategories =
        categories?.where((cat) => cat.value != 'tat_ca').toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: 'TẤT CẢ DANH MỤC',
          style: appStyle(16, kPrimary, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child: isLoading
              ? const FoodListShimmer()
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: displayCategories?.length,
                  itemBuilder: (context, i) {
                    var category = displayCategories?[i];
                    if (category != null) {
                      return CategoryTile(
                        category: category,
                        textColor: kGrayDark,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
        ),
      ),
    );
  }
}
