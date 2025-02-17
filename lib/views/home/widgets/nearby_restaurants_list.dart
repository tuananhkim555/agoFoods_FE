import 'package:agofoods/common/shimmers/neabry_shimmer.dart';
import 'package:agofoods/hooks/fetch_restaurants.dart';
import 'package:agofoods/models/restaurants_model.dart';
import 'package:agofoods/views/home/widgets/outstanding_dish_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyRestaurants extends HookWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants("456456456");
    List<RestaurantsModel>? restaurants = hookResults.data as List<RestaurantsModel>?; 
    final isLoading = hookResults.isLoading;  
      return isLoading ? const NeabryShimmer() : Container(
      height: 190.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading ? const NeabryShimmer() : ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants!.length, (i) {
          // ignore: unused_local_variable
          var restaurant = restaurants[i];
          return RestaurantWidget(
            image: restaurant.imageUrl,
            logo: restaurant.logoUrl,
            title: restaurant.title,
            time: restaurant.time,
            rating: '3464',
            onTap: () {},
          );
        }),
      ),
    );
  }
}
