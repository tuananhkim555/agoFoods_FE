import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/background_container.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/common/shimmers/foodlist_shimmer.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/hooks/fetch_all_restaurants.dart';
import 'package:agofoods/models/restaurants_model.dart';
import 'package:agofoods/views/home/widgets/restaurants_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllNearbyRestaurants extends HookWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurants("456456456");
    List<RestaurantsModel> restaurants =
        hookResults.data as List<RestaurantsModel>? ?? [];
    final isLoading = hookResults.isLoading;

    // Debugging
    print('Hook Results Data: ${hookResults.data}');
    print('Restaurants List: $restaurants');

    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        title: ReusableText(
          text: "Tất cả nhà hàng gần bạn",
          style: appStyle(13, kWhite, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: isLoading
              ? const FoodListShimmer()
              : ListView(
                  children: List.generate(restaurants.length, (i) {
                    RestaurantsModel restaurant = restaurants[i];
                    return RestaurantTitle(restaurants: restaurant);
                  }),
                ),
        ),
      ),
    );
  }
}