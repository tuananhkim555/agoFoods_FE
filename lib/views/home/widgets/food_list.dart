import 'package:agofoods/common/shimmers/neabry_shimmer.dart';
import 'package:agofoods/constants/uidata.dart';
import 'package:agofoods/hooks/fetch_foods.dart';
import 'package:agofoods/models/foods_model.dart';
import 'package:agofoods/views/home/widgets/food_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods('456456457');
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Container(
      height: 165.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const NeabryShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(foods!.length, (i) {
                var food = foods[i];
                return FoodWidget(
                  image: food.imageUrl[0],
                  title: food.title,
                  time: food.time,
                  price: formatPriceVND(food.price ?? 0.0),
                  onTap: () {},
                );
              }),
            ),
    );
  }
}
