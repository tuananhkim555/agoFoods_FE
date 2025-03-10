import 'package:agofoods/common/custom_container.dart';
import 'package:agofoods/common/heading.dart';
import 'package:agofoods/controllers/category_controller.dart';
import 'package:agofoods/views/home/drinks_near_you_page.dart';
import 'package:agofoods/views/home/food_near_you_page.dart';
import 'package:agofoods/views/home/recommentdations_drinks_page.dart';
import 'package:agofoods/views/home/all_nearby_restaurants.dart';
import 'package:agofoods/views/home/recommentdations_foods_page.dart';
import 'package:agofoods/views/home/widgets/category_drinks_list.dart';
import 'package:agofoods/views/home/widgets/category_foods_list.dart';
import 'package:agofoods/views/home/widgets/category_list.dart';
import 'package:agofoods/views/home/widgets/drink_list.dart';
import 'package:agofoods/views/home/widgets/food_list.dart';
import 'package:agofoods/views/home/widgets/nearby_restaurants_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agofoods/common/custom_appbar.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: const CustomAppBar(
            title: 'AGO',
          )),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              const CategoryList(),
              Obx(
                () => controller.categoryValue == ""
                    ? Column(
                        children: [
                          Heading(
                            icon: Boxicons.bxs_hot,
                            title: 'Món đề cử',
                            onTap: () => Get.to(
                              () => const RecommentdationsFoodsPage(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 300),
                            ),
                          ),
                          const FoodList(),
                          Heading(
                            icon: Boxicons.bxs_store,
                            title: 'Nhà hàng nổi bật',
                            onTap: () => Get.to(
                              () => const AllNearbyRestaurants(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 300),
                            ),
                          ),
                          const NearbyRestaurants(),
                          Heading(
                            icon: Icons.location_on,
                            title: 'Món gần bạn',
                            onTap: () => Get.to(
                              () => const FoodNearYouPage(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 300),
                            ),
                          ),
                          const FoodList(),
                          Heading(
                            icon: Boxicons.bxs_bowl_hot,
                            title: 'Đồ uống đề cử',
                            onTap: () => Get.to(
                              () => const RecomentdationsDrinksPage(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 300),
                            ),
                          ),
                          const DrinkList(),
                          Heading(
                            icon: Boxicons.bxs_edit_location,
                            title: 'Đồ uống gần bạn',
                            onTap: () => Get.to(
                              () => const DrinksNearYouPage(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 300),
                            ),
                          ),
                          const DrinkList(),
                        ],
                      )
                    : CustomContainer(
                        containerContent: Column(
                        children: [
                          Heading(
                            more: true,
                            icon: Icons.food_bank,
                            title: 'Khám phá - ${controller.titleValue}',
                            trailingIcon: controller.categoryValue.isEmpty
                                ? Icons
                                    .arrow_forward_ios // Hiện icon khi không có category
                                : null,
                            onTap: () => Get.to(
                              () => controller.isFoodCategory
                                  ? const RecommentdationsFoodsPage()
                                  : const RecomentdationsDrinksPage(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 300),
                            ),
                          ),
                          if (controller.isFoodCategory)
                            const CategoryFoodsList()
                          else
                            const CategoryDrinksList(),
                        ],
                      )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
