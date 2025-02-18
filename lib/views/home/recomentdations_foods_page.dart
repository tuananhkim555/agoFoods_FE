import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/background_container.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/common/shimmers/foodlist_shimmer.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/hooks/fetch_foods.dart';
import 'package:agofoods/models/foods_model.dart';
import 'package:agofoods/views/home/widgets/food_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecomentdationsFoodsPage extends HookWidget {
  const RecomentdationsFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods('456456457');
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        title: ReusableText(
          text: "Món đề cử",
          style: appStyle(13, kWhite, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: isLoading ? const FoodListShimmer() : ListView(
            children: List.generate(foods!.length, (i) {
              FoodsModel food = foods[i];
              return FoodTitle(foods: food);
            }),
          ),
        ),
      ),
    );
  }
}
