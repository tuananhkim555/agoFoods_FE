import 'package:agofoods/common/custom_container.dart';
import 'package:agofoods/common/heading.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/views/home/drinks_near_you_page.dart';
import 'package:agofoods/views/home/food_near_you_page.dart';
import 'package:agofoods/views/home/recomentdations_foods_page.dart';
import 'package:agofoods/views/home/all_narby_restaurants.dart';
import 'package:agofoods/views/home/recomentdations_drinks_page.dart';
import 'package:agofoods/views/home/widgets/category_list.dart';
import 'package:agofoods/views/home/widgets/drink_list.dart';
import 'package:agofoods/views/home/widgets/food_list.dart';
import 'package:agofoods/views/home/widgets/nearby_restaurants_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agofoods/common/custom_appbar.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: kPrimary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: CustomAppBar(
            title: 'AGO Foods',
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_outlined,
                    color: kPrimary, size: 24.h),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: CustomContainer(
              containerContent: Column(
            children: [
              const CategoryList(),
              Heading(
                text: 'Nhà hàng nổi bật',
                onTap: () {
                  Get.to(() => const AllNarbyRestaurants(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 300));
                },
              ),
              const NearbyRestaurants(),
              Heading(
                text: 'Món đề cử',
                onTap: () {
                  Get.to(() => const RecomentdationsFoodsPage(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 300));
                },
              ),
              const FoodList(),
              Heading(
                text: 'Món gần bạn',
                onTap: () {
                  Get.to(() => const FoodNearYouPage(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 300));
                },
              ),
              const FoodList(),
              Heading(
                text: 'Đồ uống đề cử',
                onTap: () {
                  Get.to(() => const RecomentdationsDrinksPage(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 300));
                },
              ),
              const DrinkList(),
              Heading(
                text: 'Đồ uống gần bạn',
                onTap: () {
                  Get.to(() => const DrinksNearYouPage(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 300));
                },
              ),
            ],
          )),
        ));
  }
}
