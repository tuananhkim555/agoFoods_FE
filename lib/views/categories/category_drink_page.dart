import 'package:agofoods/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/background_container.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/common/shimmers/foodlist_shimmer.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/controllers/category_controller.dart';
import 'package:agofoods/hooks/fetch_category_drinks.dart';
import 'package:agofoods/models/drinks_model.dart';
import 'package:agofoods/views/home/widgets/drink_title.dart';

class CategoryDrinksPage extends HookWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryDrinksPage({
    super.key,
    required this.categoryId,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();

    // Trì hoãn việc cập nhật trạng thái
    useEffect(() {
      print("CategoryDrinksPage - New categoryId: $categoryId");
      if (categoryId.isEmpty) {
        print("❌ Invalid categoryId in CategoryDrinksPage");
        return null;
      }

      Future.microtask(() {
        controller.updateCategory(categoryId, categoryTitle, CategoriesModel.TYPE_DRINK);
        controller.drinksList.clear();
      });

      return null;
    }, [categoryId]);

    // Fetch dữ liệu đồ uống
    final hookResults = useFetchDrinksByCategory("345345345");

    final items = hookResults.data;
    final isLoading = hookResults.isLoading;
    final error = hookResults.error;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: categoryTitle, // Sử dụng categoryTitle làm tiêu đề
          style: appStyle(16, kGrayDark, FontWeight.bold),
        ),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: isLoading
              ? const FoodListShimmer()
              : (items == null || items.isEmpty)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ReusableText(
                            text: 'Không có dữ liệu cho danh mục này',
                          ),
                          if (error != null)
                            Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: ReusableText(
                                text: 'Lỗi: ${error.toString()}',
                                style: appStyle(12, kGray, FontWeight.w400),
                              ),
                            ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final drink = items[index];
                        if (drink is DrinksModel) {
                          return DrinkTitle(
                            color: Colors.white,
                            drinks: drink,
                          );
                        }
                        return const SizedBox();
                      },
                    ),
        ),
      ),
    );
  }
}