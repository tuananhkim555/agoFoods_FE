import 'package:agofoods/common/shimmers/foodlist_shimmer.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/hooks/fetch_category_foods.dart';
import 'package:agofoods/models/foods_model.dart';
import 'package:agofoods/views/home/widgets/food_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryFoodsList extends HookWidget {
  const CategoryFoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoodsByCategory('456456457'); 
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

 useEffect(() {
      foods = hookResults.data;
      return null;
    }, [hookResults.data]); // Cập nhật mỗi khi hookResults.data thay đổi

    return SizedBox(
      width: width,
      height: height,
      child: isLoading
          ? const FoodListShimmer()
          : Padding(
              padding: EdgeInsets.all(12.h),
              child: ListView(
                children: List.generate(foods!.length, (i) => FoodTitle(foods: foods![i]),
              )
              ),
            ),
    );
  }
}